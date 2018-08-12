class Park < ApplicationRecord
  belongs_to :user
  has_many :trails
  has_many :comments, as: :commentable
  validates :name, presence: true
end
