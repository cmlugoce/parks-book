class Trail < ApplicationRecord
  
  belongs_to :park
  belongs_to :user
 has_many :comments
 
 mount_uploader :image, ImageUploader
 validates_presence_of :name, :distance
 
end
