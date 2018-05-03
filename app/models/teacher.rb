class Teacher < User
  has_one :salary, as: :payable
  # has_many :courses
  # has_many :cohorts, through: :courses
  has_many :students, through: :cohorts
  has_many :announcements, through: :classes
  has_many :announcements, through: :cohorts
  has_many :assignments, through: :cohorts
end
