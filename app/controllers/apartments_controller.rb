class ApartmentsController < ApplicationController
  def index         # GET /apartments
    @apartments = policy_scope(Apartment).order(created_at: :desc)
  end

  def show          # GET /apartments/:id
    find_apartment
  end

  def new           # GET /apartments/new
    authorize @apartment = Apartment.new
  end

  def create        # POST /apartments
    authorize @apartment = Apartment.new(user_params)
    @apartment.save
  end

  def edit          # GET /apartments/:id/edit
    find_apartment
  end

  def update        # PATCH /apartments/:id
    find_apartment
    @apartment.update(user_params)
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

def user_params
  params.permit(:name, :description, :street, :city, :postal_code,
    :bedrooms, :bathrooms, )
end
