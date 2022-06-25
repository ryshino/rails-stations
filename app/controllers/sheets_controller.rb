class SheetsController < ApplicationController
  before_action :require_user_logged_in, only: [:index]

  def index
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @date = params[:date]
    @reservations = Reservation.all

   if @movie.screen_id == 1
    @sheets = Sheet.where(screen_id: 1)
   elsif @movie.screen_id == 2
    @sheets = Sheet.where(screen_id: 2)
   else
    @sheets = Sheet.where(screen_id: 3)
   end
  end

  
  private
end
