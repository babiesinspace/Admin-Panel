class Student < User
  has_many :student_cohorts
  has_many :cohorts, through: :student_cohorts
  has_many :courses, through: :cohorts
  has_many :grades
  has_many :assignments, through: :cohorts
  has_many :announcements, through: :courses
  has_many :teachers, through: :courses
end