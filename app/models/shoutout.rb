class Shoutout < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
    
    has_many :create_messages, dependent: :destroy
    
    # validates :author, uniqueness: { scope: :receiver }

    scope :between, -> (author_id, receiver_id) do
        where("(shoutouts.author_id = ? AND shoutouts.receiver_id = ?)
        OR (shoutouts.author_id = ? AND shoutouts.receiver_id = ?)",
        author_id, receiver_id, receiver_id, author_id)
    end
end
