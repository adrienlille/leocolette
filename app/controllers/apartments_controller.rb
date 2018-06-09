class ApartmentsController < ApplicationController
  def index         # GET /apartments
    @apartments = Apartment.all
  end

  def show          # GET /apartments/:id
    find_apartment
  end

  def new           # GET /apartments/new
    @apartment = Apartment.new
  end

  def create        # POST /apartments
    @apartment = Apartment.new(params[:apartment])
    @apartment.save
  end

  def edit          # GET /apartments/:id/edit
    find_apartment
  end

  def update        # PATCH /apartments/:id
    find_apartment
    @apartment.update(params[:apartment])
  end

  def destroy       # DELETE /apartments/:id
    find_restaurant
    @apartment.destroy
  end
end

private

def find_apartment
  @apartment = Apartment.find(params[:id])
end
