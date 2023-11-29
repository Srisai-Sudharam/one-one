class CreateMeets < ActiveRecord::Migration[7.0]
  def change
    create_table :meets do |t|
      t.string :agenda
      t.boolean :completed

      t.timestamps
    end
  end
end
