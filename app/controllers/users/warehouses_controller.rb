class Users::WarehousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_warehouse, only: [:show]

  def index
    @warehouses = Warehouse.all
  end

  def show
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
end
