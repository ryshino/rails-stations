class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @movies = Movie.all
  end
  
  def new
    @movie_id = params[:id]
    @movie = Movie.find_by(id: @movie_id)
    @schedules = Schedule.all
    @sheets = Sheet.all
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = User.where("id LIKE ? AND name LIKE ? AND email LIKE ?", @reservation.user_id, @reservation.name, @reservation.email)
    
    if @user.blank?
      flash.now[:alert] = '存在しないユーザーです'
      @movies = Movie.all
      render :index, status: 400
    else
      if @reservation.save
        flash[:notice] = '予約に成功しました'
        redirect_to admin_reservations_path
      else
        flash.now[:alert] = '予約に失敗しました'
        @movies = Movie.all
        render :index, status: 400
      end
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @schedule = Schedule.find_by(id: @reservation.schedule_id)
    @sheets = Sheet.all
  end

  def update
    @reservation = Reservation.new(reservation_params)
    @user = User.where("id LIKE ? AND name LIKE ? AND email LIKE ?", @reservation.user_id, @reservation.name, @reservation.email)

    if @user.blank?
      flash.now[:alert] = '存在しないユーザーです'
      @movies = Movie.all
      render :index, status: 400
    else
      @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params) 
        flash[:notice] = "登録内容を更新しました"
        redirect_to admin_reservations_path
      else
        flash.now[:alert] = '更新に失敗しました'
        @movies = Movie.all
        render :index, status: 400
      end
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    @reservation.destroy
    flash[:notice] = '予約を削除しました'
    redirect_to admin_reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name, :user_id)
  end

end
