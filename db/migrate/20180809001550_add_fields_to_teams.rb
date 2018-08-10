class AddFieldsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :owner, :boolean, default: false
  end
end
