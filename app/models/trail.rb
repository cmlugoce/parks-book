class Trail < ApplicationRecord
  belongs_to :park
  belongs_to :user

  validates :name, presence: true
  validates :distance, presence: true
end
