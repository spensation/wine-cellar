require 'rails_helper'

describe Bottle do
	
	it 'has a name, vintage, category, price, and producer_id' do
		france = Country.create(:name => 'France')
		yves = User.create(:username => 'yves', :password_digest => 'winesnob')
		languedoc = Appellation.create(
			:name => 'Languedoc Picpoul de Pinet',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		hugues_beauvignac = Producer.create(
			:name => 'Hugues Beauvignac', 
			:established => 1985, 
			:appellation_id => languedoc.id
			)
		expect { Bottle.create(
			:name => 'Hugues Beavignac Picpoul',
			:vintage => 2017,
			:category => 'white',
			:price => 11.99,
			:producer_id => hugues_beauvignac.id,
			:user_id => yves.id
			) }.to_not raise_error
		hugues_beauvignac_picpoul = Bottle.create(
			:name => 'Hugues Beavignac Picpoul',
			:vintage => 2017,
			:category => 'white',
			:price => 11.99,
			:producer_id => hugues_beauvignac.id,
			:user_id => yves.id
			)
		expect(hugues_beauvignac_picpoul.name).to eq('Hugues Beavignac Picpoul')
		expect(hugues_beauvignac_picpoul.vintage).to eq(2017)
		expect(hugues_beauvignac_picpoul.category).to eq('white')
		expect(hugues_beauvignac_picpoul.price).to eq(11.99)
		expect(hugues_beauvignac_picpoul.producer_id).to eq(hugues_beauvignac.id)
		expect(hugues_beauvignac_picpoul.user_id).to eq(yves.id)
	end

	it 'belongs to a producer' do
		france = Country.create(:name => 'France')
		yves = User.create(:username => 'yves', :password_digest => 'winesnob')
		languedoc = Appellation.create(
			:name => 'Languedoc Picpoul de Pinet',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		hugues_beauvignac = Producer.create(
			:name => 'Hugues Beauvignac', 
			:established => 1985, 
			:appellation_id => languedoc.id
			)
		hugues_beauvignac_picpoul = Bottle.create(
			:name => 'Hugues Beavignac Picpoul',
			:vintage => 2017,
			:category => 'white',
			:price => 11.99,
			:producer_id => hugues_beauvignac.id,
			:user_id => yves.id
			)

		updated_hugues_beauvignac = Producer.find_by(:name => 'Hugues Beauvignac')
		updated_hugues_beauvignac_picpoul = Bottle.find_by(:name => 'Hugues Beavignac Picpoul')

		expect(updated_hugues_beauvignac.bottles).to include(updated_hugues_beauvignac_picpoul)
		expect(updated_hugues_beauvignac_picpoul.producer).to eq(updated_hugues_beauvignac)
	end

	it 'belongs to a user' do
		france = Country.create(:name => 'France')
		yves = User.create(:username => 'yves', :password_digest => 'winesnob')
		languedoc = Appellation.create(
			:name => 'Languedoc Picpoul de Pinet',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		hugues_beauvignac = Producer.create(
			:name => 'Hugues Beauvignac', 
			:established => 1985, 
			:appellation_id => languedoc.id
			)
		hugues_beauvignac_picpoul = Bottle.create(
			:name => 'Hugues Beavignac Picpoul',
			:vintage => 2017,
			:category => 'white',
			:price => 11.99,
			:producer_id => hugues_beauvignac.id,
			:user_id => yves.id
			)

		updated_yves = User.find_by(:username => 'yves')
		updated_hugues_beauvignac_picpoul = Bottle.find_by(:name => 'Hugues Beavignac Picpoul')

		expect(updated_yves.bottles).to include(updated_hugues_beauvignac_picpoul)
		expect(updated_hugues_beauvignac_picpoul.user).to eq(updated_yves)
	end

end