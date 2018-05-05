class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.datetime :startdate
      t.datetime :enddate
      t.references :course
      t.references :teacher
      
      t.timestamps
    end
  end
end
