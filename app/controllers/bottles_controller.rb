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
		@bottle = Bottle.new
	end

	def create
		@user = User.find(params[:user_id])
		@bottle = Bottle.create(bottle_params)
		if @bottle.save
			redirect_to user_path(@user)
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
		params.require(:bottle).permit(:name, :price, :user_id, :category, :vintage)
	end
end
