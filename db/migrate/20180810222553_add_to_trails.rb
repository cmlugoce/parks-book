class AddToTrails < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :park_id, :integer
  end
end
