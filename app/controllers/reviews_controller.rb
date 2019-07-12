# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]

    @review.save
    redirect_to product_path params[:product_id]
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path params[:product_id]
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
