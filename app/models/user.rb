class User < ApplicationRecord
  searchkick text_middle: [:name, :username]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :teams, dependent: :nullify
  has_many :projects, through: :teams, source: :project
  has_many :owned_projects, foreign_key: "user_id", class_name: "Project"

  has_many :authored_shoutouts, class_name: 'Shoutout', foreign_key: 'author_id'
  has_many :received_shoutouts, class_name: 'Shoutout', foreign_key: 'received_id'
  has_many :create_messages, dependent: :destroy

  has_many :notes, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end

