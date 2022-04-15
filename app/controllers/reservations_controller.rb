class ReservationsController < ApplicationController
  def new
    if reservation_parameter?
      flash[:alert] = '日時と座席を選択してください'
      redirect_to movies_path
    else
      @reservation = Reservation.new
      @movie = Movie.find(params[:movie_id])
      @sheet = Sheet.find(params[:sheet_id])
      @schedule = params[:schedule_id]
      @date = params[:date]
      @user = User.find_by(id: current_user.id) 
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @schedule = Schedule.find_by(id: @reservation.schedule_id)
    @movie = Movie.find_by(id: @schedule.movie_id)
    @user = User.find_by(id: current_user.id)

    respond_to do |format|
      if @reservation.save
        ReservationMailer.with(user: @user, reservation: @reservation, movie: @movie, schedule: @schedule).complete_reservation.deliver
        format.html { redirect_to(@movie, notice: '予約が完了しました') }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name)
  end

  def reservation_parameter?
    params[:date].blank?
    params[:sheet_id].blank?
  end
end
