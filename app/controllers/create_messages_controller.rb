class CreateMessagesController < ApplicationController
    before_action :authenticate_user!
    before_action do
        @shoutout = Shoutout.find(params[:shoutout_id])
    end

    def index
        @create_messages = @shoutout.create_messages
        @create_message = @shoutout.create_messages.build
    end

    def create
        @create_message ||= @shoutout.create_messages.build(create_message_params)
        @create_message.shoutout_id = @shoutout.id
        @create_message.user = current_user
        if @create_message.save!
            flash[:notice] = "Your shoutout was sent!"
            redirect_to shoutout_create_messages_path(@shoutout)
        end
    end

    def update
        @create_message ||= CreateMessage.find params[:id]
    
        if @create_message.update(is_public: params[:is_public])
          flash[:success] = "Vote changed"
        else
          flash[:danger] = "Vote could not be changed"
        end
    
        redirect_to shoutout_create_messages_path(@shoutout)
      end
    

    def destroy
        @create_message ||= CreateMessage.find params[:id]
        @create_message.destroy
        redirect_to shoutout_create_messages_path(@shoutout)
    end

    private
    def create_message_params
        params.require(:create_message).permit(:body, :user_id, :is_public)
    end
end
