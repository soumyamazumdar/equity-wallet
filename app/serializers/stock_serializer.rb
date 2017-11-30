class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_stocks, :stocks_available, :price, :company_id, :created_at, :updated_at
  
  has_many :users
  has_many :transactions
end
