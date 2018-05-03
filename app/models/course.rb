class Course < ApplicationRecord
  belongs_to :teacher, class_name: "User",
                       foreign_key: "user_id"
  belongs_to :student, class_name: "User",
                       foreign_key: "user_id"
  belongs_to :admin, class_name: "User",
                     foreign_key: "student_id"
  has_many :announcements
  has_many :classes
end
