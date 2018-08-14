class Project < ApplicationRecord
    has_many :teams, dependent: :destroy
    has_many :users, through: :teams, source: :user
    
    belongs_to :user

    validates(:title, presence: true)
    validates(:description, presence: true)

    has_many_attached :images
end
