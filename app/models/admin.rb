class Admin < User
  has_one :salary, as: :payable
  has_many :courses, primary_key: "id", foreign_key: "user_id"
  has_many :cohorts, through: :courses
  has_many :announcements, through: :cohorts
end 