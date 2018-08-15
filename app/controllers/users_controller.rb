class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
        @shoutouts = Shoutout.all
        @create_messages = CreateMessage.all
    end
end
