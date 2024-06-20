class Admins::PowerBanksController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_power_bank, only: [:show, :edit, :update, :destroy]

  def index
    @power_banks = PowerBank.all
  end

  def show
  end

  def new
    @power_bank = PowerBank.new
    load_associations
  end

  def edit
    load_associations
  end

  def create
    @power_bank = PowerBank.new(power_bank_params)
    if @power_bank.save
      redirect_to admins_power_banks_path, notice: 'Power Bank was successfully created.'
    else
      load_associations
      render :new
    end
  end  

  def update
    if @power_bank.update(power_bank_params)
      redirect_to admins_power_banks_path(@power_bank), notice: 'Power Bank was successfully updated.'
    else
      load_associations
      render :edit
    end
  end

  def destroy
    @power_bank.destroy
    redirect_to admins_power_banks_path, notice: 'Power Bank was successfully destroyed.'
  end

  private

  def set_power_bank
    @power_bank = PowerBank.find(params[:id])
  end

  def power_bank_params
    params.require(:power_bank).permit(:charge, :status, :user_id, :station_id, :warehouse_id)
  end

  def load_associations
    @users = User.all
    @stations = Station.all
    @warehouses = Warehouse.all
  end
end
