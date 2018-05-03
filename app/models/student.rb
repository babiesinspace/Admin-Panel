class Student < User
  has_many :courses
  has_many :cohorts, through: :courses
  has_many :grades
  has_many :assignments, through: :cohorts
  has_many :announcements, through: :courses
  has_many :teachers, through: :courses
end 