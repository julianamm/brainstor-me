class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:edit, :update, :destroy]

  
    def new
      @team = current_user.teams.build
      @user = current_user
    end

    def create
      @team = current_user.teams.build(team_params)
      @team.users << current_user
  
      respond_to do |format|
        if @team.save
          redirect_to team_path(@team)
        else
          render :new
        end
      end
    end

    def index
      @teams = Team.all.order("created_at DESC")
    end
  
    def show
    end

    def edit
    end


    def update
      respond_to do |format|
        if @team.update(team_params)
          redirect_to team_path(@team)
        else
          render :edit
        end
      end
    end
  
  
    def destroy
      @team.destroy
      
    end
  
    private
    def find_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, users_attributes: [:id, :name, :email, :username, :_destroy])
    end
end
