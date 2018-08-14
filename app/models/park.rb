class Park < ApplicationRecord
  belongs_to :user
  has_many :trails, :dependent => :destroy
 # has_many :comments
  validates :name, presence: true

  mount_uploader :image, ImageUploader
 

  
end
