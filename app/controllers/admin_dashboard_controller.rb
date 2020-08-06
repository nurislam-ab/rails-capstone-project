# Class documentation comment
class AdminDashboardController < ApplicationController
  layout 'admin'
  before_action :require_login

  def articles_list
    @articles = Article.includes(:author, :votes, :category).all.order('created_at desc')
  end

  def categories_list
    @categories = Category.all.order('created_at desc')
  end

  def users_list
    @users = User.all.order('created_at desc')
  end

  def votes_list
    @votes = Vote.includes(:user, :article).all.order('created_at desc')
  end
end
