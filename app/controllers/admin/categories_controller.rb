class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def new
  end
  
  def create
  end
  
end
