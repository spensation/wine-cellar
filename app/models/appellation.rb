class Appellation < ApplicationRecord
	has_many :varietals
	has_many :producers
	belongs_to :country

	validates :name, :region, :tier, :presence => true
end
