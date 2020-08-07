# Class documentation comment
class ArticlesController < ApplicationController
  before_action :require_login, only: %i[edit update new create]

  def index
    @articles = Article.with_attached_image.includes(:category, :author, :votes).all.order('created_at desc')
    @categories = Category.all.order('priority, name, created_at desc')
  end

  def show
    @article = Article.with_attached_image.includes(:category, :author, :votes).find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def edit
    @article = Article.with_attached_image.includes(:category).find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
    @category = @article.category_id
  end

  def create
    @article = current_user.articles.build(article_params)
    @categories = Category.all.map { |c| [c.name, c.id] }

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }

    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_back(fallback_location: root_path, notice: 'Article was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:author_id, :title, :text, :image, :category_id, :preview_text)
  end
end
