class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :remove_image, :distance, :date, :description, :difficulty, :comment_list
  
  has_one :park

  def comment_list
    object.comments.map do |comment|
      {
        id: comment.id,
        user: {
          id: comment.user_id,
          name: User.find(comment.user_id).name
        },
        body: comment.body
      }
    end
  end
end
