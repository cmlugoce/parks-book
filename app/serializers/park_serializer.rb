class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image
  has_many :trails
  def image
		return object.image.url(:medium)
	end
end
