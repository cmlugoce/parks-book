class Park < ApplicationRecord
  belongs_to :user
  has_many :trails
  validates :name, presence: true
end
