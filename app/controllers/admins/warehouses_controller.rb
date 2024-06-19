class Admins::WarehousesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def index
    @warehouses = Warehouse.all
  end
  
  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to admins_warehouses_path, notice: 'Warehouse was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to admins_warehouses_path, notice: 'Warehouse was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to admins_warehouses_path, notice: 'Warehouse was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warehouse_params
      params.require(:warehouse).permit(:name, :address)
    end

    def authenticate_admin!
      unless current_admin
        redirect_to root_path, alert: "Access denied."
      end
    end
end
