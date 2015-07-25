class ReviewsController < ApplicationController

  def new
  
  end

  def create
    self.review = Review.new(review_params)
    self.review.author=current_user
    if review.save
      flash[:success] = "Review created."
      ## redirect_to sciezka usera.....
    else
      render action: 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating, :user_id)
    end
end
