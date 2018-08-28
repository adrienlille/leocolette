class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :check_if_account_type_is_set, :except => [:saveaccounttype, :setaccount]

  def home
  end

  def about
  end

  def setaccount
    if current_user.profile.nil?
      @profile = Profile.new
      @profile.user = current_user
      @profile.save!
    else
      redirect_to root_path
    end
  end

  private

  def check_if_account_type_is_set
    if user_signed_in?
      redirect_to setaccount_path if current_user.profile.nil?
    end
  end
end
