describe Appellation do

	it 'has a name, a tier, a region and a country_id' do 
		france = Country.create(:name => 'France')
		expect { Appellation.create(:name => 'Cotes du Rhone', :tier => 'AOC', :region => 'Rhone', :country_id => france.id) }.to_not raise_error
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		expect(languedoc.name).to eq('Languedoc')
		expect(languedoc.tier).to eq('AOC')
		expect(languedoc.region).to eq('Languedoc-Roussillion')
		expect(languedoc.country_id).to eq(france.id)
	end

	it 'has many varietals' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		piquepoul = Varietal.create(:name => 'Piquepoul', :country_of_origin => 'France', :appellation_id => languedoc.id)
		syrah = Varietal.create(:name => 'Syrah', :country_of_origin => 'France', :appellation_id => languedoc.id)

		updated_languedoc = Appellation.find_by(:name => 'Languedoc')

		expect(updated_languedoc.varietals).to include(piquepoul)
		expect(updated_languedoc.varietals).to include(syrah)
	end

	it 'belongs to a country' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)

		updated_france = Country.find_by(:name => 'France')
		updated_languedoc = Appellation.find_by(:name => 'Languedoc')

		expect(updated_france.appellations).to include(updated_languedoc)
		expect(updated_languedoc.country).to eq(updated_france)
	end
end