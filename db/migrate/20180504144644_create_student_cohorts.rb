class CreateStudentCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :student_cohorts do |t|
      t.references :student, references: :users
      t.references :cohort, foreign_key: true

      t.timestamps
    end
    add_foreign_key :student_cohorts, :users, column: :student_id
  end
end
