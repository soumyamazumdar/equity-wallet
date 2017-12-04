class AddColumnsToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :stocks_sold_count, :integer, default: 0
  end
end
