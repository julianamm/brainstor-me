class CreateMessage < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user

  validates :body, presence: true
end
