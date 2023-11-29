class ChangeDefaultValueForRole < ActiveRecord::Migration[7.0]
  def change
    change_column_default :employees, :role, from: 0, to: 2
  end
end
