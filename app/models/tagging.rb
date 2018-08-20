class Tagging < ApplicationRecord
    belongs_to :tag
    belongs_to :user

    validates :user_id, uniqueness: { scope: :tag_id }
end
