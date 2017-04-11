class CreateFinancialIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_indicators do |t|
      t.string :name

      t.timestamps
    end
  end
end
