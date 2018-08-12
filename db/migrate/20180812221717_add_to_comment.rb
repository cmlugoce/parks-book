class AddToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :trail_id, :integer
  end
end
