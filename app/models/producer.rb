class Producer < ApplicationRecord
	has_many :bottles
	belongs_to :appellation
	delegate :country, :to => :appellation, :allow_nil => true
end
