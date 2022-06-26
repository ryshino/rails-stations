class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @theaters = Theater.all
    @screens = Screen.where(theater_id: 1)
  end

  def screen_select
    @screens = Screen.where(theater_id: params[:theater_id]).pluck(:screen, :id)
  end

  def create
    @movie = Movie.create(movie_params)

    if @movie.save
      flash[:notice] = '作成に成功しました'
      redirect_to admin_movies_path
    else
      @theaters = Theater.all
      @screens = Screen.all
      flash.now[:alert] = '作成に失敗しました'
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @schedule = @movie.schedules.all
    @theaters = Theater.all
    @screens = Screen.all
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params) 
      flash[:notice] = "登録内容を更新しました"
      redirect_to admin_movies_path
    else
      @theaters = Theater.all
      @screens = Screen.all
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    flash[:notice] = '映画を削除しました'
    redirect_to admin_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:id, :name, :year, :is_showing, :description, :image_url, :screen_id, :theater_id)
  end
end
