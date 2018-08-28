class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :trail
  belongs_to :user
end
