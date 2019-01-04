class Bottle < ApplicationRecord
	belongs_to :user
	has_one :producer
	accepts_nested_attributes_for :producer
end
