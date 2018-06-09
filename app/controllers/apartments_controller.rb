class ApartmentsController < ApplicationController
  def index         # GET /apartments
    @apartments = Apartment.all
  end

  def show          # GET /apartments/:id
    @apartment = find_apartment
  end

  def new           # GET /apartments/new
    @apartment = Apartment.new
  end

  def create        # POST /apartments
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
  end

  def edit          # GET /apartments/:id/edit
    @apartment = find_apartment
  end

  def update        # PATCH /apartments/:id
    @restaurant = find_apartment
    @restaurant.update(params[:restaurant])
  end

  def destroy       # DELETE /apartments/:id
  end
end

private

def find_apartment
  Apartment.find(params[:id])
end
