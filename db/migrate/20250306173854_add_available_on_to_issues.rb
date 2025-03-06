class AddAvailableOnToIssues < ActiveRecord::Migration[7.1]
  def change
    add_column :issues, :available_on, :text
  end
end
