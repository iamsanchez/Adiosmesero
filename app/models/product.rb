class Product < ActiveRecord::Base
  has_many  :Categories
 validates :Name, :Description, :Price, presence: true
 validates :Price,  numericality: {greater_than: 0}
 validates :Tax, numericality: {greater_than: 0, less_than: 100}
 #mount_uploader :Image, ImageUploader
end