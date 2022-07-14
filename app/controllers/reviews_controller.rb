class ReviewsController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @movie = Movie.find(params[:movie_id])
    if @movie.reviews.blank?
      @reviews = 0
    else
      @reviews = @movie.reviews.all
    end
  end

  def new
    @review = Review.new
    @movie = Movie.find(params[:movie_id])
    @user = User.find_by(id: current_user.id) 
  end

  def create
    @review = Review.create(review_params)

    if @review.save
      flash[:notice] = 'レビューを投稿しました'
      redirect_to movies_path
    else
      @movie = Movie.find(params[:movie_id])
      @user = User.find_by(id: current_user.id)
      flash.now[:alert] = 'レビューが投稿できませんでした'
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @movie = Movie.find(params[:movie_id])
    @user = User.find_by(id: current_user.id) 
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = "レビュー内容を更新しました"
      redirect_to movies_path
    else
      @review = Review.find(params[:id])
      @movie = Movie.find(params[:movie_id])
      @user = User.find_by(id: current_user.id) 
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy
    flash[:notice] = 'レビューを削除しました'
    redirect_to movies_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :score, :user_id, :movie_id)
  end
end
