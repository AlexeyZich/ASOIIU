class CreateIndicatorValues < ActiveRecord::Migration[5.0]
  def change
    create_table :indicator_values do |t|
      t.integer :project_id
      t.integer :indicator_id
      t.date :date_i

      t.timestamps
    end 
  end
end
