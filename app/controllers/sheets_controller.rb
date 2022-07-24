class SheetsController < ApplicationController
  before_action :require_user_logged_in, only: [:index]

  def index
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @date = params[:date]
    @reservations = Reservation.all

    if @movie.theater_id == 1
      if @movie.screen_id == 1
        @sheets_a = Sheet.where(screen_id: 1, theater_id: 1, row: "a")
        @sheets_b = Sheet.where(screen_id: 1, theater_id: 1, row: "b")
        @sheets_c = Sheet.where(screen_id: 1, theater_id: 1, row: "c")
      elsif @movie.screen_id == 2
        @sheets_a = Sheet.where(screen_id: 2, theater_id: 1, row: "a")
        @sheets_b = Sheet.where(screen_id: 2, theater_id: 1, row: "b")
        @sheets_c = Sheet.where(screen_id: 2, theater_id: 1, row: "c")
      else
        @sheets_a = Sheet.where(screen_id: 3, theater_id: 1, row: "a")
        @sheets_b = Sheet.where(screen_id: 3, theater_id: 1, row: "b")
        @sheets_c = Sheet.where(screen_id: 3, theater_id: 1, row: "c")
      end
    else
      if @movie.screen_id == 1
        @sheets_a = Sheet.where(screen_id: 1, theater_id: 2, row: "a")
        @sheets_b = Sheet.where(screen_id: 1, theater_id: 2, row: "b")
        @sheets_c = Sheet.where(screen_id: 1, theater_id: 2, row: "c")
      elsif @movie.screen_id == 2
        @sheets_a = Sheet.where(screen_id: 2, theater_id: 2, row: "a")
        @sheets_b = Sheet.where(screen_id: 2, theater_id: 2, row: "b")
        @sheets_c = Sheet.where(screen_id: 2, theater_id: 2, row: "c")
      else
        @sheets_a = Sheet.where(screen_id: 2, theater_id: 2, row: "a")
        @sheets_b = Sheet.where(screen_id: 2, theater_id: 2, row: "b")
        @sheets_c = Sheet.where(screen_id: 2, theater_id: 2, row: "c")
      end
    end
  end

  
  private
end
