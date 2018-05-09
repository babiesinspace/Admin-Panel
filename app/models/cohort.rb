class Cohort < ApplicationRecord
  belongs_to :course
  has_many :student_cohorts, dependent: :destroy
  has_many :students, through: :student_cohorts
  has_many :assignments, dependent: :destroy
  belongs_to :teacher
  has_many :announcements

  def fullname
    self.course.name + " " + self.name
  end 

    #Returns an array of [student_id, grade]
  def get_grades
    self.student_cohorts.pluck(:student_id, :grade)
  end

end
