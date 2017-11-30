class TransactionSerializer < ActiveModel::Serializer
	 attributes :id, :stocks_bought, :total_cost, :comp_id, :stock_id, :user_id,  :stocks_sold, :stocks_sold_count, :sold_total

	 belongs_to :stock
	 belongs_to :user
end	 