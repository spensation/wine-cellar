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

	describe "GET #show" do
		it "assigns the requested country to @country" do
			country = FactoryBot.create(:country)
			get :show, params: { id: country.id }
			assigns(:country).should eq(country)
		end

		it "renders the #show view" do
			get :show, params: { id: FactoryBot.create(:country) }
			response.should render_template :show
		end
	end
end