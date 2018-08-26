class AppellationsController < ApplicationController
	def index
		@country = Country.find(params[:id])
		@appellations = @country.appellations
	end

	def show
		@appellation = Appellation.find(params[:id])
	end
end
