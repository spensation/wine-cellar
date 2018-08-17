require 'rails_helper'

describe User do 
	
	it 'has a username and a password_digest' do
		expect { User.create(:username => 'jacques', :password_digest => 'secret') }.to_not raise_error
		yves = User.create(:username => 'yves', :password_digest => 'winesnob')
		expect(yves.username).to eq('yves')
		expect(yves.password_digest).to eq('winesnob')
	end

	it 'has many bottles' do
		jacques = User.create(:username => 'jacques', :password_digest => 'secret')
		hugues_beauvignac = Producer.create(:name => 'Hugues Beauvignac', :established => 1984)
		picpoul_de_pinet = Bottle.create(
			:name => 'Picpoul de Pinet',
			:vintage => 2016,
			:category => 'white',
			:price => 11.99,
			:user_id => jacques.id,
			:producer_id => hugues_beauvignac.id
			)
		picpoul = Bottle.create(
			:name => 'Picpoul',
			:vintage => 2017,
			:category => 'white',
			:price => 19.79,
			:user_id => jacques.id,
			:producer_id => hugues_beauvignac.id)

		updated_jacques = User.find_by(:username => 'jacques')

		expect(updated_jacques.bottles).to include(picpoul_de_pinet)
		expect(updated_jacques.bottles).to include(picpoul)
	end

end