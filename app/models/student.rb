class Student < User
  has_many :student_cohorts, dependent: :destroy
  has_many :cohorts, through: :student_cohorts
  has_many :courses, through: :cohorts
  has_many :assignments, through: :cohorts
  has_many :announcements, through: :courses
  has_many :teachers, through: :courses

  #Returns an array of [cohort_id, grade]
  def get_grades
    arr = self.student_cohorts.joins(:cohort).pluck(:grade, :name, :cohort_id, :course_id)
    arr.map! {|subarr| {grade: subarr[0] ||= 0, name: subarr[1], cohort_id: subarr[2], course_id: subarr[3]} }
  end

  def get_course_grade(cohort_id)
    stuco = StudentCohort.find_by(student_id: self.id, cohort_id: cohort_id).grade 
    stuco.nil? ? "N/A" : stuco
  end 

  def self.with_no_enrollments_in(cohort)
    includes(:student_cohorts).
      references(:student_cohorts).
      where.not(student_cohorts: { cohort_id: cohort.id })
  end
  
end