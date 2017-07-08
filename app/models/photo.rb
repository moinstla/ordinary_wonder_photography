class Photo < ActiveRecord::Base
  has_many :reviews

  has_attached_file :image, :styles => { :large => "500x500>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
end
