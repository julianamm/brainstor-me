class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @users = User.all
    end

    def show
        find_user
        @users = User.all
        @projects = Project.all
        @team = Team.where(project_id: :id)
        
        @create_messages = CreateMessage.where(is_public: true)

        search = params[:query].present? ? params[:query] : nil
        @projects = if search 
          Project.where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
        else
          @projects = Project.order(created_at: :desc)
        end
    end

    private
    def user_params 
		params.require(:user).permit(:name, :username, :email, :photo, :bio, :location, { tag_ids: [] })
    end
    def find_user
        @user = User.find(params[:id])
    end
end
