# Class documentation comment
class CategoriesController < ApplicationController
  before_action :require_login, only: %i[edit update new create destroy]
  layout 'admin', only: %i[new create edit update destroy]

  def show
    @category = Category.includes(articles: %i[votes author]).find(params[:id])
    @categories = Category.all.order('priority, name, created_at desc')
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_admin_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_admin_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_back(fallback_location: root_path, notice: 'Category was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
