class Transaction < ApplicationRecord

  belongs_to :user
  belongs_to :stock

  after_commit :update_purchase_total, on: :create

  def update_purchase_total
  	stock = Stock.find(self.stock_id)
  	/transaction = Transaction.find(self.transaction_id)
  	transaction.Purchasetotal = transaction.Purchasetotal + transaction.total_cost
  	transaction.update!/
  end
  
end
