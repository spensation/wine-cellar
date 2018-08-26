describe AppellationsController do
	describe "GET #index" do
		it "populates an array of appellations" do
			appellation = FactoryBot.create(:appellation)
			get :index
			assigns(:appellations).should eq([appellation])
		end


		it "renders the :index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "assigns the requested appellation to @appellation" do
			appellation = FactoryBot.create(:appellation)
			get :show, params: { id: appellation.id }
			assigns(:appellation).should eq(appellation)
		end

		it "renders the #show view" do
			get :show, params: { id: FactoryBot.create(:appellation) }
			response.should render_template :show
		end
	end
end