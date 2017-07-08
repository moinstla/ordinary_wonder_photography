class Photo < ActiveRecord::Base
  has_many :reviews

  has_attached_file :image, :styles => { :medium => "700x700", :small => "100x100" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
end
