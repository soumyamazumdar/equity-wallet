class AddPurchasetotalToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :Purchasetotal, :integer
  end
end
