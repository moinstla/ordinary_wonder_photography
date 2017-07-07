class ReviewsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @review = @photo.reviews.new
  end

  def create
  @photo = Photo.find(params[:photo_id])
  @review = @photo.reviews.new(review_params)
  if @review.save
    redirect_to photo_path(@review.photo)
  else
    render :new
  end
end

def destroy
  @photo = Photo.find(params[:photo_id])
  @review = Review.find(params[:id])
  @review.destroy
    redirect_to photo_path(@review.photo)
end
private
def review_params
  params.require(:review).permit(:content)
end
end
