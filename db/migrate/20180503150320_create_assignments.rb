class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :instructions
      t.datetime :startdate
      t.datetime :enddate
      t.integer :grade
      t.references :cohort

      t.timestamps
    end
  end
end
