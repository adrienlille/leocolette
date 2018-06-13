class ApartmentsController < ApplicationController
  def index         # GET /apartments
    @apartments = policy_scope(Apartment).order(created_at: :desc)
  end

  def show          # GET /apartments/:id
    find_apartment
    @booking = Booking.new
  end

  def new           # GET /apartments/new
    authorize @apartment = Apartment.new
  end

  def create        # POST /apartments
    authorize @apartment = Apartment.new(user_params)
    @apartment.user = current_user
    @apartment.save!
    redirect_to apartment_path(@apartment)
  end

  def edit          # GET /apartments/:id/edit
    find_apartment
  end

  def update        # PATCH /apartments/:id
    find_apartment
    @apartment.update(user_params)
    redirect_to apartment_path(@apartment)
  end

  def destroy       # DELETE /apartments/:id
    find_restaurant
    @apartment.destroy
  end

  def mine
    authorize @apartments = Apartment.where(user: current_user)
  end
end

private

def find_apartment
  authorize @apartment = Apartment.find(params[:id])
end

def user_params
  params.require(:apartment).permit(:name, :description, :street, :city, :postal_code,
    :bedrooms, :bathrooms, )
end
