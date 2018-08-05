class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :thumbnail
      t.string :location
      t.datetime :deadline
      t.text :highlights
      t.text :results

      t.timestamps
    end
  end
end
