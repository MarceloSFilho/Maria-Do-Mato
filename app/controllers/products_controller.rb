class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  include Pagy::Backend

  def index
    if params[:query].present?
      @product = policy_scope(Product)
      @products = Product.search_by_products(params[:query])
      @pagy, @products = pagy_countless(@products, items: 16)
    else
      @products = policy_scope(Product)
      @pagy, @products = pagy_countless(@products, items: 16)
    end
  end

  def show
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(@product)
    authorize @product
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end
end
