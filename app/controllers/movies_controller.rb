class MoviesController < ApplicationController
  # GET /movies
  # GET /admin/movies
  def index
    @movies = Movie.all
  end
end
