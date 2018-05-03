class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :teachers, -> { where(type: 'Teacher') } 
  scope :students, -> { where(type: 'Student') } 
  scope :admins, -> { where(type: 'Admin') }
end
