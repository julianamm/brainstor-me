class CreateShoutouts < ActiveRecord::Migration[5.2]
  def change
    create_table :shoutouts do |t|
      t.integer :author_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :shoutouts, :author_id, unique: true
    add_index :shoutouts, :receiver_id, unique: true
  end
end
