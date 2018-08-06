class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :currency
      t.date :date_p

      t.timestamps
    end
  end
end
