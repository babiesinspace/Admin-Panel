class AddGradeToStudentCohort < ActiveRecord::Migration[5.2]
  def change
    add_column :student_cohorts, :grade, :integer
  end
end
