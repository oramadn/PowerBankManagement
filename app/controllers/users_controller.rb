class UsersController < ApplicationController
    before_action :authenticate_user! # Ensure user is authenticated
    before_action :set_user, only: [:edit, :update]
  
    def edit
      
    end
  
    def update
      if @user.update_with_password(user_params)
        redirect_to users_page_path(@user), notice: 'Your profile was successfully updated.' # Change the redirect path as needed
      else
        render :edit
      end
    end
  
    private
  
    def set_user
      @user = current_user
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
    end
  end
  