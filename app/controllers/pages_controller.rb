class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :check_if_account_type_is_set, :except => [:saveaccounttype, :setaccount]

  def home
  end

  def about
  end

  def setaccount
  end

  def saveaccounttype
    if current_user.account_type.nil?
      current_user.account_type = user_params[:account_type]
      current_user.save!
    end
  end

  private

  def user_params
    params.permit(:account_type)
  end

  def check_if_account_type_is_set
    if user_signed_in?
      redirect_to setaccount_path if current_user.account_type.nil?
    end
  end
end
