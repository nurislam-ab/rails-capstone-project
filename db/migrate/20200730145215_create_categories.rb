# frozen_string_literal: true

# Class documentation comment
class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string  :name,      null: false
      t.integer :priority,  null: false

      t.timestamps
    end

    add_index :categories, :id
    add_index :categories, :name
  end
end
