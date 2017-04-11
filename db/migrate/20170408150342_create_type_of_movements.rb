class CreateTypeOfMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :type_of_movements do |t|
      t.string :name
      t.integer :activity_id

      t.timestamps
    end
  end
end
