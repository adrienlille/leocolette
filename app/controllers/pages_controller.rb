class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :check_if_account_type_is_set, :except => [:saveaccounttype, :setaccount]

  def home
  end

  def about
  end

  def setaccount
    @profile = Profile.new
  end

  private

  def check_if_account_type_is_set
    if user_signed_in?
      redirect_to setaccount_path if current_user.profile.nil?
    end
  end
end
