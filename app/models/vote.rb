# frozen_string_literal: true

class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :article_id }

  belongs_to :user
  belongs_to :article

  scope :most_voted_articles, -> { select('article_id, count(article_id) as votes').group(:article_id).order('votes desc').limit(5) }
end
