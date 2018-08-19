class CreateMessage < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user

  validates :body, presence: true

  validates :is_public, inclusion: {
    in: [true, false], message: "must be true or false"
  }
  
  def private?
    !is_public?
  end
end
