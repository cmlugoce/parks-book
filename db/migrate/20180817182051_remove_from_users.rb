class RemoveFromUsers < ActiveRecord::Migration[5.2]
  def change

    remove_column :users, :username, :string
    remove_column :users, :oauth_token, :string
    remove_column :users, :oauth_expires_at, :datetime
  end
end
