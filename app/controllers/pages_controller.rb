class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @navbar_home = true
  end

  def about
  end

  private

  def check_if_account_type_is_set
    if user_signed_in?
      redirect_to setaccount_path if (current_user.profile.nil? or current_user.profile.account_type.nil?)
    end
  end
end
