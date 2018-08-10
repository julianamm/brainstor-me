class RemoveFieldsFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :location, :string
    remove_column :projects, :deadline, :string
    remove_column :projects, :highlights, :text
    remove_column :projects, :results, :text
  end
end
