describe CountriesController do
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