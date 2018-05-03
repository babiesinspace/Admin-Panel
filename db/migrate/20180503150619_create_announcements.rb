class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.datetime :startdate
      t.datetime :enddate
      t.references :cohort
      
      t.timestamps
    end
  end
end
