class ReservationJob < ActiveJob::Base


  def perform(current_user_id, listing_id)

    user = User.find(current_user_id)
    listing = Listing.find(listing_id)
    # do something
    # byebug
    ReservationMailer.booking_mailer(user,listing).deliver_now
  end
end
