class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @navbar_home = true
  end

  def about
  end

  private


end
