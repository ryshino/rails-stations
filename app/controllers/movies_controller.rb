class MoviesController < ApplicationController
  # GET /movies
  # GET /admin/movies
  def index
    @movies = Movie.all
  end

  #GET /admin/movies/new
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:notice] = '投稿に成功しました'
      redirect_to movies_path
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end
  

  private
  
  def movie_params
    params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
  end
end
