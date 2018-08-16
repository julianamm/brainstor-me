class RemoveUniqueFromShoutouts < ActiveRecord::Migration[5.2]
  def change
    remove_index :shoutouts, :author_id
    remove_index :shoutouts, :receiver_id
  end
end


