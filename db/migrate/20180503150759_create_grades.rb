class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :cohort_id
      t.integer :value
      
      t.timestamps
    end
  end
end
