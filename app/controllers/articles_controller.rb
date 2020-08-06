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

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    @categories = Category.all.map { |c| [c.name, c.id] }

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
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
