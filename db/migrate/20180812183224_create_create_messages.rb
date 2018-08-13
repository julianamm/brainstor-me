class CreateCreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :create_messages do |t|
      t.text :body
      t.belongs_to :shoutout, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
