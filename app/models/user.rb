class User < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_ADDRESS_REGEX = /\A[a-zA-Z0-9, .]*\z/
	
	before_save { self.email = email.downcase }
	
	has_secure_password

	has_many :transactions, dependent: :destroy
	has_many :stocks, through: :transactions

	validates :name, presence: true, length: {minimum: 5}
	validates :email, presence: true
    validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    validates :password, presence: true
    validates_confirmation_of :password
    validates_presence_of :password_confirmation
	
	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			all
		end
	end

end
