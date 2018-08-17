class Country < ApplicationRecord
	has_many :appellations
	has_many :producers, through: :appellations
end
