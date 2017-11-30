class Stock < ApplicationRecord

  has_many :transactions, dependent: :destroy
  has_many :users, through: :transactions

  belongs_to :company
  accepts_nested_attributes_for :transactions

  validates :name, presence: true, length: {minimum: 2}

end
