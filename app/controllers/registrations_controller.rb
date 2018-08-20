class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_in_params, only: [:create]
  def create
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:account_type, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:account_type, :email, :password, :password_confirmation])
  end
end
