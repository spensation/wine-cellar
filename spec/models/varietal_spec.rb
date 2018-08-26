describe Varietal do
	
	it 'has a name, country_of_origin and an appellation_id' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		expect { Varietal.create(
			:name => 'Piquepoul', 
			:country_of_origin => 'France', 
			:appellation_id => languedoc.id
			) }.to_not raise_error
		piquepoul = Varietal.create(
			:name => 'Piquepoul',
			:country_of_origin => 'France', 
			:appellation_id => languedoc.id
			)
		expect(piquepoul.name).to eq('Piquepoul')
		expect(piquepoul.country_of_origin).to eq('France')
		expect(piquepoul.appellation_id).to eq(languedoc.id)
	end

	it 'belongs to an appellation' do
		france = Country.create(:name => 'France')
		languedoc = Appellation.create(
			:name => 'Languedoc',
			:tier => 'AOC',
			:region => 'Languedoc-Roussillion',
			:country_id => france.id
			)
		piquepoul = Varietal.create(
			:name => 'Piquepoul',
			:country_of_origin => 'France', 
			:appellation_id => languedoc.id
			)
		updated_languedoc = Appellation.find_by(:name => 'Languedoc')
		updated_piquepoul = Varietal.find_by(:name => 'Piquepoul')

		expect(updated_languedoc.varietals).to include(updated_piquepoul)
		expect(updated_piquepoul.appellation).to eq(updated_languedoc)
	end
end
