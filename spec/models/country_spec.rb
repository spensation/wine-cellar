describe Country do

	context "validations" do
		it { should validate_presence_of :name }

	end

	context "associations" do
		it { should have_many(:appellations) }
		it { should have_many(:producers).through(:appellations) }

	end 

	it "has a valid factory" do
		expect(build(:country)).to be_valid
	end
end