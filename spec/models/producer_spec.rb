describe Producer do 
	context "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :established }
	end

	context "associations" do
		it { should belong_to(:appellation) }
		it { should have_many(:bottles) }
	end
	
end
