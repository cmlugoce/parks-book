class Trail < ApplicationRecord
  belongs_to :park,  optional: true
  belongs_to :user
end
