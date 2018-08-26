describe BottlesController do
	describe "GET #index" do
		it "populates an array of bottles" do
			bottle = FactoryBot.create(:bottle)
			get :index
			assigns(:bottles).should eq([bottle])
		end


		it "renders the :index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "assigns the requested bottle to @bottle" do
			bottle = FactoryBot.create(:bottle)
			get :show, params: { id: bottle.id }
			assigns(:bottle).should eq(bottle)
		end

		it "renders the #show view" do
			get :show, params: { id: FactoryBot.create(:bottle) }
			response.should render_template :show
		end
	end
end