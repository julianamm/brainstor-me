class CreateMessage < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user

  validates :body, presence: true

  def self.public
    where(is_public: true)
  end
   def self.private
    where(is_public: false)
  end
end
