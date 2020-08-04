# frozen_string_literal: true

# Class documentation comment
class AdminDashboardController < ApplicationController
  layout 'admin'

  def articles_list
    @articles = Article.all.order('created_at desc')
  end

  def categories_list
    @categories = Category.all.order('created_at desc')
  end

  def users_list
    @users = User.all.order('created_at desc')
  end

  def votes_list
    @votes = Vote.all.order('created_at desc').includes(:article, :user)
  end
end
