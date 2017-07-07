class Review < ActiveRecord::Base
  belongs_to :photo
  validates :name, :presence => true
  validates :content, :presence => true
end
