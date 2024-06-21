class Users::StationsController < ApplicationController
    layout 'user'
    before_action :authenticate_user!
    before_action :set_station, only: [:show]

    # GET /users/stations or /users/stations.json
    def index
        @stations = Station.all
    end

    # GET /users/stations/1 or /users/stations/1.json
    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
        @station = Station.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_params
        params.require(:users_station).permit(:status, :location_id)
    end
end
