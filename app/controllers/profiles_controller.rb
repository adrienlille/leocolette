class ProfilesController < ApplicationController
  # def setaccount
  #   authorize @profile = current_user.profile
  #   @profile.attributes = set_account_params
  #   @profile.save!
  #   redirect_to root_path
  # end

  def setaccount
    if (current_user.profile.nil? or current_user.profile.account_type.nil?)
      authorize @profile = Profile.new
      @profile.user = current_user
      @profile.save!
    else
      redirect_to root_path
    end
  end

  def edit
    authorize @profile = current_user.profile
  end

  def update
    authorize @profile = current_user.profile
    @profile.attributes = profile_params
    @profile.save!
    redirect_to profile_path(@profile)
  end

  def show
    authorize @profile = Profile.find(params[:id])
  end

  private

  def set_account_params
    params.require(:profile).permit(:account_type)
  end

  def profile_params
    params.require(:profile).permit(:photo, :first_name, :last_name, :city, :postal_code, :about_me, :gender)
  end
end
