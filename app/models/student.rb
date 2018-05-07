class Student < User
  has_many :student_cohorts
  has_many :cohorts, through: :student_cohorts
  has_many :courses, through: :cohorts
  has_many :assignments, through: :cohorts
  has_many :announcements, through: :courses
  has_many :teachers, through: :courses

  #Returns an array of [cohort_id, grade]
  def get_grades
    self.student_cohorts.pluck(:cohort_id, :grade)
  end

  def get_course_grade(cohort_id)
    stuco = StudentCohort.find_by(student_id: self.id, cohort_id: cohort_id).grade 
  end 

end