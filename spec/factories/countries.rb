
FactoryBot.define do
	factory :country do |f|
		f.name { Faker::Address.country }

		trait :country_with_producers do
			transient do
				producers_count 5  
			end

			after :create do |country, evaluator|
				FactoryBot.create_list :appellation, evaluator.producers_count, country: country
			end
		end
	end
end

	