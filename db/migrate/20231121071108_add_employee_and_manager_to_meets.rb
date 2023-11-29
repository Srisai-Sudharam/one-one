class AddEmployeeAndManagerToMeets < ActiveRecord::Migration[7.0]
  def change
    add_reference :meets, :manager, foreign_key: {to_table: :employees}
    add_reference :meets, :employee, foreign_key: true
  end
end
