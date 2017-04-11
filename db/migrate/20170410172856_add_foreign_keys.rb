class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :type_of_movements, :type_of_activities, column: :activity_id
    add_foreign_key :inflows_outflows, :type_of_movements, column: :movement_id
    add_foreign_key :inflows_outflows, :projects, column: :project_id
    add_foreign_key :decisions, :projects, column: :project_id
    add_foreign_key :decisions, :collegials, column: :collegial_id
    add_foreign_key :decisions, :type_of_decisions, column: :type_decision_id    
    add_foreign_key :indicator_values, :projects, column: :project_id
    add_foreign_key :indicator_values, :financial_indicators, column: :indicator_id
    
    add_index :indicator_values, :project_id
    add_index :indicator_values, :indicator_id   
    add_index :decisions, :project_id
    add_index :decisions, :collegial_id
    add_index :decisions, :type_decision_id
    add_index :inflows_outflows, :movement_id
    add_index :inflows_outflows, :project_id
    add_index :type_of_movements, :activity_id

  end
end
