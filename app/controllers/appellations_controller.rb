class AppellationsController < ApplicationController
	def index
		if params[:country_id]
			begin
				@appellations = Country.find_by(params[:country_id]).appellations
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Country not found."
			end
		else
			@appellations = Appellation.all 
		end
	end

	def show
		if params[:country_id]
			begin
				@appellation = Country.find(params[:country_id]).appellations.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Appellation not found."
				redirect_to country_appellations_path
			end
		else
			begin
				@appellation = Appellation.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Appellation not found."
				redirect_to country_appellations_path
			end
		end
	end
end
