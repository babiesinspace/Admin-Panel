class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.references :student_cohort
      t.timestamps
    end
  end
end
