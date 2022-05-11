class CitiesController < ApplicationController
    def show
        @id = params[:id]
        @city_gossips = City.find(@id).gossips
    end
end
