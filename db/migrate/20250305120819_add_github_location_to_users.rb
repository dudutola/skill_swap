class AddGithubLocationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :github_location, :string
  end
end
