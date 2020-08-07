# Class documentation comment
class HomeController < ApplicationController
  def index
    @most_voted_articles = Vote.most_voted_articles
    @recent_articles = Article.with_attached_image.includes(:category, :author).recent_articles
    @categories = Category.categories_by_priority.includes(articles: %i[author votes]).all
    @articles = Article.with_attached_image.includes(:category, :author, :votes).all.order('created_at desc')
  end
end
