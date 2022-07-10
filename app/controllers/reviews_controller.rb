class ReviewsController < ApplicationController
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
     @user = User.find_by(id: current_user.id)
     flash.now[:alert] = 'レビューが投稿できませんでした'
     render :new
   end
  end

  private

  def review_params
    params.require(:review).permit(:content, :score, :user_id, :movie_id)
  end
end
