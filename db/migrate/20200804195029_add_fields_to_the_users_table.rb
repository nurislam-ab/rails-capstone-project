# frozen_string_literal: true

# Class documentation comment
class AddFieldsToTheUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :website, :string
  end
end
