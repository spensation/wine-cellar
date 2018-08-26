describe CountriesController do
	describe "GET #index" do
		it "populates an array of countries" do
			country = FactoryBot.create(:country)
			get :index
			assigns(:countries).should eq([country])
		end


		it "renders the :index view" do
			get :index
			response.should render_template :index
		end
	end
end