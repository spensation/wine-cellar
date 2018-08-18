require 'rails_helper'

describe Country do
	
	it 'has a name' do
		expect { Country.create(:name => 'France') }.to_not raise_error
		france = Country.create(:name => 'France')
		expect(france.name).to eq('France')
	end

	it 'has many appellations' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Rousillion',
			:country_id => france.id
			)
		cotes_du_rhone = Appellation.create(
			:name => 'Cotes du Rhone',
			:tier => 'AOC',
			:region => 'Rhone',
			:country_id => france.id
			)

		updated_france = Country.find_by(:name => 'France')

		expect(updated_france.appellations).to include(languedoc)
		expect(updated_france.appellations).to include(cotes_du_rhone)
	end

	it 'has many producers through appellations' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Rousillion',
			:country_id => france.id
			)
		hugues_beauvignac = Producer.create(:name => 'Hugues Beauvignac', :established => 1985, :appellation_id => languedoc.id)
		omarine = Producer.create(:name => 'Omarine', :established => 1973, :appellation_id => languedoc.id)

		updated_france = Country.find_by(:name => 'France')

		expect(updated_france.producers).to include(hugues_beauvignac)
		expect(updated_france.producers).to include(omarine)
	end

end