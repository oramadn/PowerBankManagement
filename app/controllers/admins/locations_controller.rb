class Admins::LocationsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_location, only: [:show, :edit, :update, :destroy]
  
    def index
      @locations = Location.all
    end
  
    def new
      @location = Location.new
    end
  
    def create
      @location = Location.new(location_params)
      if @location.save
        redirect_to admins_locations_path, notice: 'Location was successfully created.'
      else
        render :new
      end
    end
  
    def show
      # Assuming you have a show view for admin to see details of a location
    end
  
    def edit
      # Edit form for updating location details
    end
  
    def update
      if @location.update(location_params)
        redirect_to admins_locations_path, notice: 'Location was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @location.destroy
      redirect_to admins_locations_path, notice: 'Location was successfully deleted.'
    end
  
    private
  
    def set_location
      @location = Location.find(params[:id])
    end
  
    def location_params
      params.require(:location).permit(:name, :lat, :lng)
    end
  
    def authenticate_admin!
      unless current_admin
        redirect_to root_path, alert: "Access denied."
      end
    end
  end
  