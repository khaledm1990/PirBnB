class ReservationJob < ActiveJob::Base


  def perform(current_user, listing)
    user = current_user
    listing = listing
    # do something
    byebug
    ReservationMailer.booking_mailer(user,listing).deliver_now
  end
end
