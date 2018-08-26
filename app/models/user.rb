class User < ApplicationRecord
	validates :username, :email, :presence => true, :uniqueness => true
	has_secure_password
	has_many :bottles
end
