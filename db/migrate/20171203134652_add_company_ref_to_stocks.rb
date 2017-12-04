class AddCompanyRefToStocks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :stocks, :company, foreign_key: true
  end
end
