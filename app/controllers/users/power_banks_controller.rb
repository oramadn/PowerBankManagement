class Users::PowerBanksController < ApplicationController
    before_action :authenticate_user!
  
    def reserve
      @power_bank = PowerBank.find(params[:id])
      if @power_bank.update(status: 'reserved', user_id: current_user.id)
        redirect_to users_stations_path, notice: "Power Bank reserved successfully."
      else
        redirect_to users_stations_path, alert: "Failed to reserve Power Bank."
      end
    end

    def unreserve
      @power_bank = PowerBank.find(params[:id])
      if @power_bank.update(status: 'available', user_id: nil)
        redirect_to users_stations_path, notice: "Power Bank unreserved successfully."
      else
        redirect_to users_stations_path, alert: "Failed to unreserve Power Bank."
      end
    end
  end
  