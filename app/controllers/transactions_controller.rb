class TransactionsController < ApplicationController


  def new
    gon.client_token = generate_client_token
  end

  def create
    # byebug
    # @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:reservation_id])
    @reservation_time = (@reservation.end_date - @reservation.start_date).to_i
    amount = (@reservation_time*@reservation.listing.price.to_i)
    # byebug
    @result = Braintree::Transaction.sale(
              amount: amount,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?

      ReservationJob.perform_later(current_user.id, @reservation.listing.id)
      redirect_to reservation_path(@reservation), notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end


end
