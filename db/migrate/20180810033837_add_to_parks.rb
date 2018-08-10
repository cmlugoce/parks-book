class AddToParks < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :user_id, :integer
  end
end
