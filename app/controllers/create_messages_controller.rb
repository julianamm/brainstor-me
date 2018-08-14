class CreateMessagesController < ApplicationController
    before_action :authenticate_user!
    before_action do
        @shoutout = Shoutout.find(params[:shoutout_id])
    end

    def index
        @create_messages = @shoutout.create_messages
        @create_message = @shoutout.create_messages.build
    end

    def new
        @create_message = @shoutout.create_messages.build
    end

    def create
        @create_message ||= @shoutout.create_messages.build(create_message_params)
        @create_message.shoutout_id = @shoutout.id
        if @create_message.save!
            flash[:notice] = "Your shoutout was sent!"
            redirect_to shoutout_create_messages_path(@shoutout)
        end
    end

    def destroy
        @create_message ||= CreateMessage.find params[:id]
        @create_message.destroy
    end

    private
    def create_message_params
        params.require(:create_message).permit(:body, :user_id)
    end
end
