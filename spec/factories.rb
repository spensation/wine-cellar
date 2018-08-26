FactoryBot.define do

	factory :appellation do
		name { Faker::Lorem.word }
		tier { Faker::Lorem.word }
		region { Faker::Lorem.word }
		country
	
	end

	factory :producer do
		name { Faker::Name.name }
		established { Faker::Number.between(1789, 1985) }
		appellation
	end
end