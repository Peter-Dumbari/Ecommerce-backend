class Api::V1::ProductsController < ApplicationController
    # before_action :set_product, only: [:show, :update, :destroy]

    def index
        @product = Product.all
        render json: @product
    end

    def show
        render json: @product
    end

    def create
        @product = Product.new(product_params)
        if @product.save
          render json: { status: 'Success', message: 'Product added successfully' }, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
          render json: @product
        else
          render json: { status: 'error', message: 'Product was not updated' },status: :unprocessable_entity
        end
    end
    
    def destroy
        @product.destroy
        head :no_content
    end

    private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :price, :quantity_available)
      end
end
