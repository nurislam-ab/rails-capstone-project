# frozen_string_literal: true

# Class documentation comment
class Category < ApplicationRecord
  has_many :articles

  scope :categories_by_priority, -> { order('priority DESC') }

  def latest_article
    articles.order(created_at: :desc)
  end
end
