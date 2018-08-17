class ShoutoutsController < ApplicationController
    before_action :authenticate_user!

    def index
        @shoutouts = Shoutout.order(created_at: :desc)
        @users = User.all

        search = params[:query].present? ? params[:query] : nil
        @users = if search 
          User.where("name LIKE ? OR username LIKE ?", "%#{search}%", "%#{search}%")
        else
          @users = User.order(created_at: :desc)
        end
    end

    def create
        if Shoutout.between(params[:author_id], params[:receiver_id]).present?
            @shoutout = Shoutout.between(params[:author_id], params[:receiver_id]).first
        else
            @shoutout = Shoutout.create!(shoutout_params)
        end
        redirect_to shoutout_create_messages_path(@shoutout)
    end

    def destroy
        @shoutout ||= Shoutout.find params[:id]
        @shoutout.destroy
    end

    private
    def shoutout_params
        params.permit(:author_id, :receiver_id)
    end
end
