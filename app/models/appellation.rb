class Appellation < ApplicationRecord
	has_many :varietals
	has_many :producers
	belongs_to :country
end
