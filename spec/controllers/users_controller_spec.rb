describe UsersController do
	describe "GET #show" do
		it "assigns the requested user to @user" do
			user = FactoryBot.create(:user)
			get :show, params: { id: user.id }
			assigns(:user).should eq(user)
		end

		it "renders the #show view" do
			get :show, params: { id: FactoryBot.create(:user) }
			response.should render_template :show
		end
	end
end