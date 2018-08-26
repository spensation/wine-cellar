describe Country do

	# before do 
	# 	@country = FactoryBot.create(:country, :country_with_producers)
	# end


	describe "validations" do
		it 'is valid with a name' do
			country = FactoryBot.build(:country)
			expect(country).to be_valid
			# @country.name.should_not == nil
		end

		it "is invalid without a name" do
			country = FactoryBot.build(:country, :name => nil)
			country.valid?
			expect(country.errors[:name]).to include("can't be blank")
		end
	end

	describe "associations" do

		it 'has many appellations' do
			assc = described_class.reflect_on_association(:appellations)
			expect(assc.macro).to eq :has_many
		 end

		it 'has many producers through appellations' do
			assc = described_class.reflect_on_association(:producers)
			expect(assc.macro).to eq :has_many 
	    end
	end 
end