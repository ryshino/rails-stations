namespace :notifications do
  desc '予約のリマインドメール'
  task notice_mail: :environment do
    ReservationsController.new.notice_reservations
  end
end