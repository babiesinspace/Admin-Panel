class Cohort < ApplicationRecord
  belongs_to :course
  has_many :student_cohorts
  has_many :students, through: :student_cohorts
  has_many :assignments
  has_many :grades
  has_one :teacher
  has_many :announcements
end
