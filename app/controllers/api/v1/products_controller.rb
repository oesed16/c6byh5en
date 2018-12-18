class Api::V1::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created  
    else
      render json: @product.errors, status: :unprocessable_entity  
    end
  end
  
  private

	def product_params
	  params.require(:product).permit(:name, :price)
  end
  
end
