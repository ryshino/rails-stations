class ReservationsController < ApplicationController
  def new
    if reservation_parameter?
      flash[:alert] = '日時と座席を選択してください'
      redirect_to movies_path
    else
      @reservation = Reservation.new
      @movie = Movie.find(params[:movie_id])
      @sheet = Sheet.find(params[:sheet_id])
      @schedule_id = params[:schedule_id]
      @schedule = Schedule.find_by(id: @schedule_id)
      @date = params[:date]
      @user = User.find_by(id: current_user.id) 
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @schedule = Schedule.find_by(id: @reservation.schedule_id)
    @movie = Movie.find_by(id: @schedule.movie_id)
    @user = User.find_by(id: current_user.id)

    if @reservation.save
      ReservationMailer.with(user: @user, reservation: @reservation, movie: @movie, schedule: @schedule).complete_reservation.deliver
      flash[:notice] = '予約が完了しました'
      redirect_to movie_path(@movie)
    else
      flash[:alert] = '予約に失敗しました'
      redirect_to movie_schedule_sheets_path(@movie, @schedule, date: @reservation.date)
    end
  end

  def notice_reservations
    @schedules = Schedule.all
    @schedules.each do |schedule|
      if Date.tomorrow == schedule.start_time.to_date
        schedule.reservations.each do |reservation|
          @user = User.find_by(id: reservation.user_id)
          @sheet = Sheet.find_by(id: reservation.sheet_id)
          @movie = Movie.find_by(id: schedule.movie_id)
          @schedule = schedule
          ReservationMailer.with(user: @user, sheet: @sheet, movie: @movie, schedule: @schedule).send_notice_reservations.deliver
        end
      end
    end
  end


  private

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name, :user_id)
  end

  def reservation_parameter?
    params[:date].blank?
    params[:sheet_id].blank?
  end
end
