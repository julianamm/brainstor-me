class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

 
  def new
    @project = current_user.projects.build
    @user = current_user
  end

  def create
    @project = current_user.projects.build(
      title: project_params[:title],
      description: project_params[:description],
      thumbnail: project_params[:thumbnail],
      user_id: current_user.id,
      user_ids: project_params[:user_ids]
    )
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def index
    search = params[:query].present? ? params[:query] : nil
    @projects = if search 
      Project.where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    else
      @projects = Project.order(created_at: :desc)
    end

    @shoutouts = Shoutout.all
    @users = User.all
  end


  def show
    find_project
    @users = User.all
    @team = Team.where(project_id: :id)
    
    @create_message = CreateMessage.new

    @note = Note.new
    @notes = @project.notes.order(:position)
  end

  def edit
  end

  def update
    if @project.update(
      title: project_params[:title],
      description: project_params[:description],
      thumbnail: project_params[:thumbnail],
      user_id: current_user.id,
      user_ids: project_params[:user_ids]
    )
      redirect_to project_path(@project)
    else
      render :edit
    end

  end

  def destroy
    @project.destroy
  end

  def sort 
    params[:note].each_with_index do |id, index|
      Note.where(id: id).update_all(position: index + 1)
    end 
    head :ok
  end 

  private
  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :thumbnail, { user_ids: [] }, user_id: current_user.id)
  end
end
