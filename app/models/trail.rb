class Trail < ApplicationRecord
  belongs_to :park
  belongs_to :user
 has_many :comments

  validates :name, presence: true
  validates :distance, presence: true
end
