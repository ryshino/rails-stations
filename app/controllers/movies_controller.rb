class MoviesController < ApplicationController

  # GET /movies
  # GET /admin/movies
  def index
    t = Movie.arel_table
    name = params[:name]
    description = params[:description]
    @movies = Movie.all
    @movies = @movies.where(t[:name].matches("%#{name}%")) if name.present?
    @movies = @movies.where(t[:description].matches("%#{description}%")) if description.present?

    case params[:is_showing]
    when nil
      @movies
    when ""
      @movies
    else
      @movies = @movies.where(is_showing: params[:is_showing])
    end
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

  private
  
  def movie_params
    params[:movie].permit(:id, :name, :year, :is_showing, :description, :image_url)
  end
end
