class AddImageToParks < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :image, :string
  end
end
