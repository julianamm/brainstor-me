class TeamsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @team = Team.new(team_params)

        if @team.save
            flash.now[:success] = 'Team was successfully created.'
            redirect_to @team
        else
            flash.now[:notice] = @team.errors.full_messages
            render "new"
        end
    end

    def update
        # TO-DO: update leader and members (i.e. add or remove member)
        if @team.update(team_params)
            flash.now[:success] = "Team was successfully updated."
            redirect_to @team
        else
            flash.now[:notice] = @team.errors.full_messages
            render "edit"
        end
    end

    def destroy
        @team.destroy
    end

    private
        def team_params
            params.require(:team).permit(:name)
        end

end
