class Student < User
  has_many :courses
  has_many :cohorts, through: :courses
  has_many :grades
  belongs_to :cohort, through: :grades
  has_many :assignments, though: :cohorts
  has_many :announcements, though: :courses
  has_many :teachers, though: :courses
end 