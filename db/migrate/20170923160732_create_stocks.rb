class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name	
      t.integer :total_stocks
      t.integer :stocks_available
      t.integer :price	
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
