# frozen_string_literal: true

class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
      t.timestamps
    end

    add_index :article_categories, :article_id
    add_index :article_categories, :category_id
  end
end
