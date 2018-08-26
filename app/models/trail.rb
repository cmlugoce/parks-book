class Trail < ApplicationRecord
  
  belongs_to :park
  #belongs_to :user
  has_many :users, through: :comments
  has_many :comments, :dependent => :destroy
 
 mount_uploader :image, ImageUploader
 validates_presence_of :name, :distance, :date, :difficulty


 

 def self.search(search)
  where("distance LIKE ? ", "#{search}")
end

def self.search2(search)
  where("difficulty LIKE ? ", "#{search}")
end

end
