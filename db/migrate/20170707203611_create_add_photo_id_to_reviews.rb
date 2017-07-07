class CreateAddPhotoIdToReviews < ActiveRecord::Migration[5.1]
  def change
  add_column(:reviews, :photo_id, :integer)
  end
end
