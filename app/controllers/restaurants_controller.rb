class RestaurantsController < ApplicationController

  # GET /restaurents.json
  def index
    respond_to do |format|
      format.json { render json: Restaurant.fetch_data }
    end
  end

end
