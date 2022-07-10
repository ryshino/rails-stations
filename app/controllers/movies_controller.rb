class MoviesController < ApplicationController
  def index
    @search_params = movie_search_params
    @movies = Movie.search(@search_params)
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
  end

  def schedule_select
    @date = params[:date]

   if @date.blank?
    @schedules = ["選択可能なスケジュールがありません"]
   else
    @movie_id = params[:movie_id]
    @movie = Movie.find(@movie_id)
    @schedules = Schedule.where(movie_id: @movie.id)
    @schedules = @schedules.where('start_time LIKE ?', "#{@date}%").pluck(:start_time, :id)

    if @schedules.blank?
      @schedules = ["選択可能なスケジュールがありません"]
     else 
       @schedules
     end
   end
  end
  
  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
    @schedule = @movie.schedules.find_by(movie_id: @movie.id)
  end

  private

  def movie_search_params
    params.fetch(:search, {}).permit(:keyword, :is_showing, :theater_id)
  end
 end