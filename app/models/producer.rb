class Producer < ApplicationRecord
	has_many :bottles
	belongs_to :appellation

	delegate :country, :to => :appellation, :allow_nil => true
	# allows producer.appellation_country
	validates :name, :established, :presence => true
end
