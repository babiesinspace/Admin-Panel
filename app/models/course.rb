class Course < ApplicationRecord
  belongs_to :admin, class_name: "User", foreign_key: 'user_id'


  has_many :cohorts
  has_many :student_cohorts, through: :cohorts
  has_many :students, through: :student_cohorts
  has_many :announcements, through: :cohorts
  has_many :assignments, through: :cohorts
end
