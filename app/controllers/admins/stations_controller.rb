class Admins::StationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
    @locations = Location.all
    @warehouses = Warehouse.all
    @power_banks = PowerBank.where(station_id: nil) # Only show unassigned power_banks
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      update_power_banks
      redirect_to admins_stations_path, notice: 'Station was successfully created.'
    else
      @locations = Location.all
      @warehouses = Warehouse.all
      @power_banks = PowerBank.where(station_id: nil)
      render :new
    end
  end  

  def edit
    @locations = Location.all
    @warehouses = Warehouse.all
    @power_banks = PowerBank.where(station_id: [nil, @station.id]) # Show unassigned and already assigned power_banks
  end

  def update
    if @station.update(station_params)
      update_power_banks
      redirect_to admins_station_path(@station), notice: 'Station was successfully updated.'
    else
      @locations = Location.all
      @warehouses = Warehouse.all
      @power_banks = PowerBank.where(station_id: [nil, @station.id])
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to admins_stations_path, notice: 'Station was successfully destroyed.'
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:location_id, :warehouse_id, :status, power_bank_ids: [])
  end  

  def update_power_banks
    if params[:station][:power_bank_ids].present?
      PowerBank.where(station_id: @station.id).update_all(station_id: nil) # Unassign all power_banks from this station
      PowerBank.where(id: params[:station][:power_bank_ids]).update_all(station_id: @station.id) # Assign selected power_banks to this station
    else
      PowerBank.where(station_id: @station.id).update_all(station_id: nil) # Unassign all power_banks from this station
    end
  end
end
