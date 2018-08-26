describe Appellation do
	context "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :region }
		it { should validate_presence_of :tier}
	end


	context "associations" do
		it { should have_many(:varietals) }
		it { should belong_to(:country) }
	end
	
end