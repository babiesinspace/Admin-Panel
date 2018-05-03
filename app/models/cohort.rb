class Cohort < ApplicationRecord
  belongs_to :course
  has_many :assignments
  has_many :grades
  has_many :students
  has_one :teacher
  has_many :announcements
end
