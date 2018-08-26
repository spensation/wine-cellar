describe User do 

	before do
		@user = FactoryBot.create(:user, :with_bottles)
		@user2 = FactoryBot.create(:user)
		
	end

	it "has a unique username" do
		@user.username.should_not == nil
		@user.username.should_not == @user2.username
	end 

	it "has a unique password" do
		@user.password_digest.should_not == nil
		@user.password_digest.should_not == @user2.password_digest
	end

	it "has a unique email address" do
		@user.email.should_not == nil
		@user.email.should_not == @user2.email
	end

	it "has many bottles" do
		@user.bottles.length.should == 5
	end
	# it 'has a username, email and a password_digest' do
	# 	expect { User.create(:username => 'jacques', :email => 'jacques@free.fr', :password_digest => 'secret') }.to_not raise_error
	# 	yves = User.create(:username => 'yves', :email => 'yves@free.fr', :password_digest => 'winesnob')
	# 	expect(yves.username).to eq('yves')
	# 	expect(yves.password_digest).to eq('winesnob')
	# end

	# it 'username must be unique' do
	# 	user = User.new(:username => 'bugs', :email => 'me@yahoo.com', :password_digest => '123456')
	# 	user.save

	# 	u = User.new(:username => 'bugs', :email => 'me@yahoo.com', :password_digest => '123456')
	# 	u.save

	# 	expect(u.errors[:username].any?).to be true 
	# end

	# it 'has many bottles' do
	# 	jacques = User.create(:username => 'jacques', :email => 'jacques@free.fr', :password_digest => 'secret')
	# 	france = Country.create(:name => 'France')
	# 	languedoc = Appellation.create(
	# 		:name => 'Languedoc',
	# 		:tier => 'AOC',
	# 		:region => 'Languedoc-Rousillion',
	# 		:country_id => france.id
	# 		)
	# 	hugues_beauvignac = Producer.create(:name => 'Hugues Beauvignac', :established => 1984, :appellation_id => languedoc.id)
	# 	picpoul_de_pinet = Bottle.create(
	# 		:name => 'Picpoul de Pinet',
	# 		:vintage => 2016,
	# 		:category => 'white',
	# 		:price => 11.99,
	# 		:user_id => jacques.id,
	# 		:producer_id => hugues_beauvignac.id
	# 		)
	# 	picpoul = Bottle.create(
	# 		:name => 'Picpoul',
	# 		:vintage => 2017,
	# 		:category => 'white',
	# 		:price => 19.79,
	# 		:user_id => jacques.id,
	# 		:producer_id => hugues_beauvignac.id)

	# 	updated_jacques = User.find_by(:username => 'jacques')

	# 	expect(updated_jacques.bottles).to include(picpoul_de_pinet)
	# 	expect(updated_jacques.bottles).to include(picpoul)
	# end

end