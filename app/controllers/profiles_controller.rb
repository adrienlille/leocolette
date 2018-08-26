class ProfilesController < ApplicationController
  def create
    authorize @profile = Profile.new(set_account_params)
    @profile.user = current_user
    @profile.save!
    redirect_to root_path
  end

  def edit
    authorize @profile = current_user.profile
  end

  def update
    authorize @profile = current_user.profile
    @profile.attributes = profile_params
    @profile.save!
  end

  private

  def set_account_params
    params.require(:profile).permit(:account_type)
  end

  def profile_params
    params.require(:profile).permit(:photo)
  end
end
