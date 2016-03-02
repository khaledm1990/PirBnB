# Preview all emails at http://localhost:3000/rails/mailers/reservation
class ReservationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation/mailer
  def booking_mail
    reservation = Reservation.last
    ReservationMailer.booking_mail(reservation)
  end

end
