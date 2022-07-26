class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    @review = current_patient.review.new review_params

    if @review.save
      redirect_to :show
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :patient_id)
  end
end