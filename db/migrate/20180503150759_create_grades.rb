class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.references :student
      t.references :cohort
      t.integer :value
      
      t.timestamps
    end
  end
end
