class Project < ApplicationRecord
    has_many :teams, dependent: :destroy
    has_many :teamers, through: :teams, source: :user
    # has_many :users, through: :teams
    
    belongs_to :user
    accepts_nested_attributes_for :teams

    validates(:title, presence: true)
    validates(:description, presence: true)
end
