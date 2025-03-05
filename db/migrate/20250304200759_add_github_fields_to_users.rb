class AddGithubFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :github_avatar_url, :string
    add_column :users, :github_username, :string
    add_column :users, :github_name, :string
    add_column :users, :github_uid, :string
    add_column :users, :provider, :string
  end
end
