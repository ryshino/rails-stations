class ReservationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def complete_reservation
    @user = params[:user]
    @reservation = params[:reservation]
    @movie = params[:movie]
    @schedule = params[:schedule]
    mail(to: @user.email, subject: '予約が完了しました！')
  end

  def send_notice_reservations
    @user = params[:user]
    @sheet = params[:sheet]
    @movie = params[:movie]
    @schedule = params[:schedule]
    mail(to: @user.email, subject: '予約のリマインドメールです')
  end
end
