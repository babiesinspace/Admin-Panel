class Announcement < ApplicationRecord
  belongs_to :course
  belongs_to :cohort, through: :course
  # belongs_to :student, through: :course
  # belongs_to :teacher, through: :course
  # belongs_to :admin, through: :course
end
