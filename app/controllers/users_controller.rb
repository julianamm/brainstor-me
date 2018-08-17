class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
        @shoutouts = Shoutout.all
        @create_messages = CreateMessage.all
    end

    private
    def user_params 
		params.require(:user).permit(:name, :username, :email, :photo, :bio, :location)
	end
end
