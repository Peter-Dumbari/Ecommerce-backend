class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    authorize_resource

    def index
        @product = Product.all
        render json: @product
    end

    def show
        product = Product.find(params[:id])
        render json: product
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
            render json: { status: 'success', message: 'Product updated successfully', product: @product }
        else
          render json: { status: 'error', message: 'Product was not updated' },status: :unprocessable_entity
        end
    end
    
    def destroy
        if @product.destroy
          render json: { status: 'success', message: 'Product deleted successfully' }
        else
          render json: { status: 'error', message: 'Product was not deleted' }, status: :unprocessable_entity
        end
    end
      

    private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :price, :quantity_available, photos_attributes: [:image_url])
      end
end
