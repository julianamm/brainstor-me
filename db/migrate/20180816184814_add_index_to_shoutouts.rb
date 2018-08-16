class AddIndexToShoutouts < ActiveRecord::Migration[5.2]
  def change
    add_index :shoutouts, :author_id
    add_index :shoutouts, :receiver_id
  end
end
