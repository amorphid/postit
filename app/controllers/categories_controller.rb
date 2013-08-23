class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit ,:update]

  def create
    @category = Category.new(params_category)

    if @category.save
      redirect_to categories_path
    else
      render "new"
    end
  end

  def edit
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def update
    if @category.update_attributes(params_category)
      redirect_to categories_path
    else
      render "edit"
    end
  end

private

  def params_category
    params[:category].permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
