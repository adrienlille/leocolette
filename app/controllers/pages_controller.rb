class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    if user_signed_in? and !account_type_is_set?
      redirect_to setaccount_path
    end
    @navbar_home = true
  end

  def about
  end

  private

  def account_type_is_set?
    current_user.profile and current_user.profile.account_type
  end
end
