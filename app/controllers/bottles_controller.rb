class BottlesController < ApplicationController
	def index
		if params[:user_id]
			begin
				@bottles = User.find_by(params[:user_id]).bottles
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "User not found."
			end
		else
			@bottles = Bottle.all 
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
end
