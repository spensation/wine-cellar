require 'rails_helper'

describe Appellation do

	it 'has a name, a tier, a region and a country_id' do 
		france = Country.create(:name => 'France')
		expect { Appellation.create(:name => 'Langudoc', :tier => 'AOC', :region => 'Languedoc-Roussillion', :country_id => france.id) }.to_not raise_error
		languedoc = Appellation.create(
			:name => 'Languedoc Picpoul de Pinet',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		expect(languedoc.name).to eq('Languedoc Picpoul de Pinet')
		expect(languedoc.tier).to eq('AOC')
		expect(languedoc.region).to eq('Languedoc-Roussillion')
		expect(languedoc.country_id).to eq(france.id)
	end

end