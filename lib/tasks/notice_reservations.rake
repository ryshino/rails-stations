namespace :notifications do
  desc '予約のリマインドメール'
  task notice_mail: :environment do
    ReservationMailer.notice_reservations.deliver_now
  end
end