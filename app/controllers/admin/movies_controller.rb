class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:notice] = '投稿に成功しました'
      redirect_to admin_movies_path
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @schedule = @movie.schedules.all
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params) 
      flash[:notice] = "登録内容を更新しました"
      redirect_to admin_movies_path
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    flash[:notice] = '投稿を削除しました'
    redirect_to admin_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:id, :name, :year, :is_showing, :description, :image_url)
  end
end
