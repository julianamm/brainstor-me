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
    @projects = Project.order(created_at: :desc)
    @shoutouts = Shoutout.all
    @users = User.all
  end


  def show
    find_project
    @users = User.all
    @team = Team.where(project_id: :id)

    @create_message = CreateMessage.new
  end

  def edit
  end

  def update
    if @project.update(
      title: project_params[:title],
      description: project_params[:description],
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

  private
  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :thumbnail, { user_ids: [] }, user_id: current_user.id)
  end
end
