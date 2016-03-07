class ReservationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation.mailer.subject


  def booking_mailer(customer, listing)
    # byebug
    @listing = listing
    @user_first_name = customer.first_name
    @user_last_name = customer.last_name
    mail(to: @listing.user.email, subject: 'New Reservation')

  end
end
