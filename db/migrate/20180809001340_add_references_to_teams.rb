class AddReferencesToTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :user, foreign_key: true
    add_reference :teams, :project, foreign_key: true
  end
end
