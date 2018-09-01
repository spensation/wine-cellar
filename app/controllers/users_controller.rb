class UsersController < ApplicationController
	def show 
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
	      log_in @user

	      redirect_to user_path(@user)
	    else
	      flash[:notice] = "Sign up failed."
	      render :new
	    end
	end

	private
		def user_params
			params.require(:user).permit(:username, :password_digest, :email)
		end
end
