class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = 'Category saved'
      redirect_to root_path
    else
      flash[:error] = 'Problem saving'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category updated'
      redirect_to root_path
    else
      flash[:error] = 'Problem updating'
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category destroyed'
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :image)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
