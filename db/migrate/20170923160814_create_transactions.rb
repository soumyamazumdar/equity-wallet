class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :stocks_bought
      t.integer :total_cost
      t.integer :comp_id
      t.references :stock, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
