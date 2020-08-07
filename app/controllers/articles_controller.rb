# Class documentation comment
class ArticlesController < ApplicationController
  before_action :require_login, only: %i[edit update new create]

  def index
    @articles = Article.with_attached_image.includes(:category, :author, :votes).all.order('created_at desc')
    @categories = Category.all.order('priority, name, created_at desc')
  end

  def show
    @article = obtain_article_with_resources
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
    @article = obtain_article_only
  end

  def update
    @article = obtain_article_only

    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article = obtain_article_only
    @article.destroy
    redirect_back(fallback_location: root_path, notice: 'Article was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def obtain_article_only
    Article.find(params[:id])
  end

  def obtain_article_with_resources
    Article.includes(:author, :votes, :category).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:author_id, :title, :text, :image, :category_id, :preview_text)
  end
end
