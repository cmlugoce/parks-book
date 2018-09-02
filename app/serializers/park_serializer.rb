class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image

  def image
		return object.image.url(:medium)
	end
end
