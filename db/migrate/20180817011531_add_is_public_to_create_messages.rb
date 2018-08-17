class AddIsPublicToCreateMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :create_messages, :is_public, :boolean, default: false
  end
end
