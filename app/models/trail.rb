class Trail < ApplicationRecord
  
  belongs_to :park
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
def next
  # if the first destination is greater the current one exists then return the next destination
  if next_trail = self.class.where("id > ?", id).first
    next_trail
  else
   Trail.first
  end
end

def previous
  # if the destination is less then current one exists then return the previous destination
  if previous_trail = self.class.where("id < ?", id).last
    previous_trail
  else
    Trail.last
  end
end
end
