# Class documentation comment
class CategoriesController < ApplicationController
  before_action :require_login, only: %i[edit update new create destroy]
  layout 'admin', only: %i[new create edit update destroy]

  def show
    @category = obtain_category
    @categories = Category.all.order('priority, name, created_at desc')
  end

  def new
    @category = Category.new
  end

  def edit
    @category = obtain_category
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
    @category = obtain_category

    if @category.update(category_params)
      redirect_to categories_admin_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = obtain_category
    @category.destroy
    redirect_back(fallback_location: root_path, notice: 'Category was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def obtain_category
    Category.includes(articles: %i[votes author]).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
