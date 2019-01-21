class Park < ApplicationRecord
  belongs_to :user
  has_many :trails, :dependent => :destroy
 
  validates :name, presence: true

  mount_uploader :image, ImageUploader
 

  def self.search(search)
   # where("location LIKE ? ", "#{search}")
    where("cast(location as text) LIKE ? ", "#{search}")
  end

  def self.search4(search)
    #where("name LIKE ? ", "#{search}")
    where("cast(name as text) LIKE ? ", "#{search}")
  end

  def next
    # if the first trail is greater the current one exists then return the next trail
    if next_park = self.class.where("id > ?", id).first
      next_park
    else
     Park.first
    end
  end
  
  def previous
    # if the trail is less then current one exists then return the previous trail
    if previous_park = self.class.where("id < ?", id).last
      previous_park
    else
      Park.last
    end
  end
end
