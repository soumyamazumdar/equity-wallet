class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :admin, :last_seen_at

  has_many :transactions
  has_many :stocks
end
