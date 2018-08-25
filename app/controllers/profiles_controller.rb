class ProfilesController < ApplicationController
  def create
    authorize @profile = Profile.new(user_params)
    @profile.user = current_user
    @profile.save!
  end


  private

  def user_params
    params.require(:profile).permit(:account_type)
  end
end
