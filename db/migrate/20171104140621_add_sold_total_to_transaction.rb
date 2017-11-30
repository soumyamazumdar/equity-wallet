class AddSoldTotalToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :sold_total, :integer, default: 0
  end
end
