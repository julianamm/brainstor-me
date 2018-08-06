class Project < ApplicationRecord
    belongs_to :user
    belongs_to :teams, optional: true

    accepts_nested_attributes_for :teams
end
