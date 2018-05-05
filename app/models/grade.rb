class Grade < ApplicationRecord
  belongs_to :student_cohort
  belongs_to :student, class_name: "StudentCohort", 
                       foreign_key: "student_id"
  belongs_to :cohort, class_name: "StudentCohort", 
                      foreign_key: "cohort_id"
end
