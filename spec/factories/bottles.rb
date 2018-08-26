FactoryBot.define do

	factory :bottle do
		name { Faker::Lorem.word}
		price { Faker::Number.decimal(2)}
		vintage { Faker::Number.between(1974, 2017)}
		category { Faker::Lorem.word}
	    user
	    producer
	
	end
end
