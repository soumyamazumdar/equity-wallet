class AddColumnsToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :stocks_sold, :integer, default: 0
  end
end
