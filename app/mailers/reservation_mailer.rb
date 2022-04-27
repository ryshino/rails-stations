class ReservationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def complete_reservation
    @user = params[:user]
    @reservation = params[:reservation]
    @movie = params[:movie]
    @schedule = params[:schedule]
    mail(to: @user.email, subject: '予約が完了しました！')
  end

  def notice_reservations
    @schedules = Schedule.all
    @schedules.each do |schedule|
      if Date.tomorrow == schedule.start_time.to_date
        @reservations = Reservation.where(schedule_id: schedule.id)
        @reservations.each do |reservation|
          @users = User.where(id: reservation.user_id)
          @users.each do |user|
            @user = user
          end
          @movie = Movie.find_by(id: schedule.movie_id)
          @schedule = schedule
          @sheet = Sheet.find_by(id: reservation.sheet_id)
        end
        mail(to: @users.pluck(:email), subject: '予約のリマインドメールです')
      end
    end
  end
end
