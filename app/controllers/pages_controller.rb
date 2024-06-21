class PagesController < ApplicationController
  before_action :set_layout

  before_action :authenticate_user!, only: [:users]
  before_action :authenticate_admin!, only: [:admins]

  def home
    # Home action logic here
  end

  def users
    # Users action logic here
  end

  def admins
    # Admins action logic here
  end

  private

  def set_layout
    if admin_signed_in?
      self.class.layout 'admin'
    elsif user_signed_in?
      self.class.layout 'user'
    else
      self.class.layout nil  # No layout for non-authenticated users
    end
  end
end
