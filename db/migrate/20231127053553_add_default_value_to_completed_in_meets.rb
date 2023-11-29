class AddDefaultValueToCompletedInMeets < ActiveRecord::Migration[7.0]
  def change
    change_column_default :meets, :completed, false
  end
end
