class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :teams, dependent: :nullify
  has_many :teamed_projects, through: :teams, source: :project

  has_many :projects
end
