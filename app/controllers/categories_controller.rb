class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params) 
    if @category.save
      flash[:notice] = 'Category has been created'
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @category.update(categor_params)
      flash[:notice] = "The category was updated"
      redirect_to categories_path
    else
      render :edit
    end

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
   @category = Category.find_by(slug: params[:id]) 
  end
end
