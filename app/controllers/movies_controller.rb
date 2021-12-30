class MoviesController < ApplicationController

  def index
    @search_params = movie_search_params
    @movies = Movie.search(@search_params)
  end


  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
    @schedule = @movie.schedules.find_by(movie_id: @movie.id)
  end

  private

  def movie_search_params
    params.fetch(:search, {}).permit(:keyword, :is_showing)
  end
 end