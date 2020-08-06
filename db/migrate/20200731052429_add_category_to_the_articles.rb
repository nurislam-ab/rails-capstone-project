# frozen_string_literal: true

# Class documentation comment
class AddCategoryToTheArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :category_id, :integer
  end
end
