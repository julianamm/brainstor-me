class NotesController < ApplicationController
  before_action :authenticate_user!
  include AmazonSignature

  def create
    @project = Project.find params[:project_id]
    @note = Note.new note_params
    @note.project = @project
    @note.user = current_user

    @hash = AmazonSignature::data_hash

    if @note.save
      if @project.user.present?
          redirect_to project_path(@project)
      else
          @notes = @project.notes.order(created_at: :desc)
          render "projects/show"
      end
    end
  end

  def destroy
    @note ||= Note.find params[:id]
    @note.destroy
    redirect_to project_path(@note.project)
  end

   def sort
    params[:note].each_with_index do |id, index|
      Note.where(id: id).update_all(position: index + 1)
    end 
    head :ok
  end 

  private
  def note_params
    params.require(:note).permit(:body, :position, :user_id)
  end
end
