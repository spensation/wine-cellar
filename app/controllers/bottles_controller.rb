class BottlesController < ApplicationController
	include ApplicationHelper
	def index
		if params[:user_id]
			begin
				@user = current_user
				@bottles = @user.bottles.build
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "User not found."
			end
		else
			@bottles = Bottle.all 
		end
	end

	def new
		@bottle = Bottle.new(:user_id => params[:user_id])
	end

	def create
		user = current_user
		@bottle = Bottle.create(bottle_params)
		if @bottle.save
			redirect_to "/users/user_id/bottles"
		else
			redirect_to root_path
		end
	end

	def show
		if params[:user_id]
			begin
				@bottle = User.find(params[:user_id]).bottles.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Bottle not found."
				redirect_to user_bottles_path
			end
		else
			begin
				@bottle = Bottle.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Bottle not found."
				redirect_to user_bottles_path
			end
		end
	end

	private 

	def bottle_params
		params.permit(:name, :price, :user_id, :category, :vintage)
	end
end
