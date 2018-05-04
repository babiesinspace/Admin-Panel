class Cohort < ApplicationRecord
  belongs_to :course
  has_many :student_cohorts
  has_many :students, through: :student_cohorts
  has_many :assignments
  has_many :grades, through: :student_cohorts
  belongs_to :teacher
  has_many :announcements

  def fullname
    self.course.name + " " + self.name
  end 
end
