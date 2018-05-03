class Admin < User
  has_one :salary, as: :payable
  has_many :courses
  has_many :cohorts, through: :courses
  has_many :announcements, through: :courses
end 