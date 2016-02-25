class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  # before_action :require_login
  def index
    @listing = Listing.all
  end

  def show
    # byebug
    @list = Listing.find(params[:id])
  end

  def index
    @listing = Listing.all
  end

  def my_listings
    @my_listings = Listing.where(user_id: current_user.id)
  end

  def new
    @listing = Listing.new
  end

  def edit
  end


  def create

    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to my_listings_path , notice: 'listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
  end
end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_path, notice: 'listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to my_listings_path, notice: 'listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


 private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:descriptions,:property_type, :room_type, :acommodates, :bedrooms, :beds, :bathrooms, :country, :street, :city, :state, :zip_code)
  end

end
