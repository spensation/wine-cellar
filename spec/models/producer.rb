require 'rails_helper'

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

end
