class Park < ApplicationRecord
  belongs_to :user
  has_many :trails, :dependent => :destroy
 
  validates :name, presence: true

  mount_uploader :image, ImageUploader
 

  def self.search(search)
    where("location LIKE ? ", "#{search}")
  end
end
