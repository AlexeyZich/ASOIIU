class AddNameColumnToInflowsOutflows < ActiveRecord::Migration[5.0]
  def change
    add_column :inflows_outflows, :name, :string
  end
end
