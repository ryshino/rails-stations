class SheetsController < ApplicationController
  before_action :require_user_logged_in, only: [:index]

  def index
    @sheets = Sheet.all
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @date = params[:date]
    @reservations = Reservation.all
  end

  
  private
  
end
