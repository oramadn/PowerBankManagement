class Users::LocationsController < ApplicationController
  layout 'user'
  before_action :authenticate_user!
  before_action :set_location, only: [:show]

  # GET /users/locations or /users/locations.json
  def index
    @locations = Location.all
  end

  # GET /users/locations/1 or /users/locations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:users_location).permit(:name, :lat, :lng)
    end
end
