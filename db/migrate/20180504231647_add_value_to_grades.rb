class AddValueToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :value, :integer
  end
end
