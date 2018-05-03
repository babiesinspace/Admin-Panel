class Cohort < ApplicationRecord
  belongs_to :course
  has_many :assignments
  has_many :grades
  has_many :students, through: :grades
  belongs_to :teacher, through: :course
  belongs_to :student, through: :course
  has_many :announcements, through: :course
end
