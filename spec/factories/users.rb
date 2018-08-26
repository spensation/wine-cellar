FactoryBot.define do
	
	factory :user do 
		username { Faker::Name.unique.name }
		email { Faker::Internet.unique.email }
		password_digest { Faker::Internet.unique.password }
	end

	trait :with_bottles do
		ignore do
			bottles_count 5  
		end

		after :create do |user, evaluator|
			FactoryBot.create_list :bottle, evaluator.bottles_count, user: user
		end

	end

end