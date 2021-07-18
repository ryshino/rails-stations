class MoviesController < ApplicationController
  before_action :set_q, only: [:index, :search]

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

  # /admin/movies/:id/edit
  def edit
    @movie = Movie.find(params[:id])    
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params) 
      flash[:notice] = "登録内容を更新しました"
      redirect_to movies_path
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    flash[:notice] = '投稿を削除しました'
    redirect_to movies_path
  end

  def search
    @movies = @q.result
    render :index
  end

  private
  
  def movie_params
    params[:movie].permit(:id, :name, :year, :is_showing, :description, :image_url)
  end
  
  def set_q
    @q = Movie.ransack(params[:q])
  end

end
