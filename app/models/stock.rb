class Stock < ApplicationRecord

  has_many :transactions, dependent: :destroy
  has_many :users, through: :transactions

  belongs_to :company
  accepts_nested_attributes_for :transactions

  validates :name, presence: true, length: {minimum: 2}
  validates :total_stocks, presence: true, numericality: {only_integer: true}
  validates :stocks_available, presence: true, numericality: {only_integer: true}
  validates :price, presence: true

end
