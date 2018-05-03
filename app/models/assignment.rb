class Assignment < ApplicationRecord
  belongs_to :cohort
  belongs_to :student, through: :cohort
  belongs_to :teacher, through: :cohort
end
