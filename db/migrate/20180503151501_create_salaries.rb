class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.integer :income
      t.references :payable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
