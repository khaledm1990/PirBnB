class Reservation < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation.mailer.subject


  def booking_mail (customer, listing)
    @user_first_name = customer.first_name
    @user_last_name = customer.user_last_name
    mail to: @cusromer.eamil

  end
end
