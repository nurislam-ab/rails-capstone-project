# frozen_string_literal: true

# Class documentation comment
class AddPreviewTextFieldToTheArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :preview_text, :string
  end
end
