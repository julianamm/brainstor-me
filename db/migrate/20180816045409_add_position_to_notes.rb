class AddPositionToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :position, :integer
  end
end
