# frozen_string_literal: true

class AddPreviewTextFieldToTheArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :preview_text, :string
  end
end
