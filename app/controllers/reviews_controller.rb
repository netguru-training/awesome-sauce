class ReviewsController < ApplicationController
  expose(:review, attributes: :review_params)

  def create
    review.author = current_user
    if review.save
      flash[:notice] = "Review created."
      ## redirect_to sciezka usera.....
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def update
    if review.save
      flash[:notice] = "Review updated."
      ## redirect_to sciezka usera.....
      redirect_to root_path
    else
      render action: 'edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id)
  end
end
