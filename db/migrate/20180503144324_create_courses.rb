class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :hours
      t.level :string
      t.references :user
      
      t.timestamps
    end
  end
end
