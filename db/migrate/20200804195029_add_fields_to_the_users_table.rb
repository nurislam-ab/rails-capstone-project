class AddFieldsToTheUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :website, :string
  end
end
