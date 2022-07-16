class Admin::ReviewsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    if @movie.reviews.blank?
      @reviews = 0
    else
      @reviews = @movie.reviews.all
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy
    flash[:notice] = 'レビューを削除しました'
    redirect_to admin_movies_path
  end
end
