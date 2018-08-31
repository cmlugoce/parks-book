class Comment < ApplicationRecord
    belongs_to :trail
    belongs_to :user
    
    validates :body, presence: true

    
end
