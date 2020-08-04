class HomeController < ApplicationController
    def index
        @most_voted_articles = Vote.most_voted_articles
        @recent_articles = Article.recent_articles
        # @latest_article_by_category = Article.latest_article_by_category
        @categories = Category.categories_by_priority.includes(:articles).first(4)
        @articles = Article.all.includes(:category).order('created_at desc')
    end
end
