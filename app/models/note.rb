class Note < ApplicationRecord
  belongs_to :project
  validates :body, presence: true
end
