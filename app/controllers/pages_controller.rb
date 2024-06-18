class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:users], unless: :admin_signed_in?
  before_action :authenticate_admin!, only: [:admins]

  def home
  end

  def users
  end

  def admins
  end
end
