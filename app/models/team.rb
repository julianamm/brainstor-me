class Team < ApplicationRecord
    belongs_to :user
    belongs_to :project

    accepts_nested_attributes_for :user, allow_destroy: true
    validates :user_id, uniqueness: { scope: :project_id }
    validates :name, presence: true
    validates :project_id, presence: true
end
