describe Producer do 
	
	it 'has a name and an established date' do
		expect { Producer.create(:name => 'Hugues Beauvignac', :established => 1985)}.to_not raise_error
		pro = Producer.create(:name => 'Hugues Beauvignac', :established => 1985)
		expect(pro.name).to eq('Hugues Beauvignac')
		expect(pro.established).to eq(1985)
	end

	it 'belongs to an appellation' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Rousillion',
			:country_id => france.id
			)
		pro = Producer.create(:name => 'Hugues Beauvignac', :established => 1985, :appellation_id => languedoc.id)

		updated_languedoc = Appellation.find_by(:name => 'Languedoc')

		expect(pro.appellation).to eq(languedoc)
		expect(updated_languedoc.producers).to include(pro)
	end

	it 'belongs to a country through an appellation' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Rousillion',
			:country_id => france.id
			)
		pro = Producer.create(:name => 'Hugues Beauvignac', :established => 1985, :appellation_id => languedoc.id)

		updated_france = Country.find_by(:name => 'France')

		expect(pro.country).to eq(updated_france)
		expect(updated_france.producers).to include(pro)
	end

	it 'has many bottles' do
		france = Country.create(:name => 'France')
		yves = User.create(:username => 'yves3', :email => 'yves3@free.fr', :password_digest => 'winesnob')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Rousillion',
			:country_id => france.id
			)
		luc_pirlet = Producer.create(:name => 'Luc Pirlet', :established => 1985, :appellation_id => languedoc.id)
		luc_pirlet_cabernet_sauvignon = Bottle.create(
			:name => 'Luc Pirlet Cabernet Sauvignon',
			:vintage => 2014,
			:category => 'red',
			:price => 8.99,
			:producer_id => luc_pirlet.id,
			:user_id => yves.id
			)
		luc_pirlet_chardonnay_unoaked = Bottle.create(
			:name => 'Luc Pirlet Chardonnay Unoaked',
			:vintage => 2017,
			:category => 'white',
			:price => 8.99,
			:producer_id => luc_pirlet.id,
			:user_id => yves.id
			)
		updated_luc_pirlet = Producer.find_by(:name => 'Luc Pirlet')

		expect(updated_luc_pirlet.bottles).to include(luc_pirlet_cabernet_sauvignon)
		expect(updated_luc_pirlet.bottles).to include(luc_pirlet_chardonnay_unoaked)
	end
end
