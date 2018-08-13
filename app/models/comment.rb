class Comment < ApplicationRecord
    belongs_to :trail
    belongs_to :user
    accepts_nested_attributes_for :user, :reject_if => :all_blank

    def username
        self.user.username if self.user
      end
end
