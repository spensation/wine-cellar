FactoryBot.define do
	factory :varietal do |f|
		f.name { Faker::Lorem.words(1)}
		f.country_of_origin { Faker::Address.country }
	end
end