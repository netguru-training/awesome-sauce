class ReviewsController < ApplicationController
  expose(:review, attributes: :review_params)
  expose(:user) { User.find(params[:user_id]) }

  def create
    review.author = current_user
    if review.save
      flash[:notice] = "Review created."
      redirect_to current_user
    else
      render action: 'new'
    end
  end

  def update
    if review.save
      flash[:notice] = "Review updated."
      redirect_to current_user
    else
      render action: 'edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id)
  end
end
