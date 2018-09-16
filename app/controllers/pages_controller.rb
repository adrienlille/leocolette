class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  before_action :skip_pundit?

  def home
    if user_signed_in? and !account_type_is_set?
      redirect_to setaccount_path
    end
    @navbar_home = true
  end

  def about
  end

  def search
    @apartments = Apartment.where(safe_params)
    fail
  end

  private

  def account_type_is_set?
    current_user.profile and current_user.profile.account_type
  end

  def safe_params
    params.permit(:city)
  end
end
