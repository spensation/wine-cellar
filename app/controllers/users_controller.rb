class UsersController < ApplicationController

	def new
		@user = User.new
		bottle = @user.bottles.build
	end

	def index
		@users = User.all
	end

	def create 
		user = User.new(user_params)
		if user.save
	      session[:user_id] = user.id

	      redirect_to '/'
	    else
	      flash[:notice] = "Sign up failed."
	      render :new
	    end
	end

	def show 
		@user = User.find(params[:id])
		@bottle = Bottle.new

	end

	private
		def user_params
			params.require(:user).permit(:username, :password, :password_confirmation, :email)
		end
end
