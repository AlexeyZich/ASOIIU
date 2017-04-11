class CreateInflowsOutflows < ActiveRecord::Migration[5.0]
  def change
    create_table :inflows_outflows do |t|
      t.integer :movement_id
      t.integer :project_id
      t.decimal :total
      t.date :date_f

      t.timestamps
    end
  end
end
