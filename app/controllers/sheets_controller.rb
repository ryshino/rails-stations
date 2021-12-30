class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @date = params[:date]
    @reservations = Reservation.all
  end

  
  private

end
