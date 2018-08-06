class CreateDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :decisions do |t|
      t.integer :project_id
      t.integer :collegial_id
      t.integer :type_decision_id
      t.date :date_d

      t.timestamps
    end
  end
end
