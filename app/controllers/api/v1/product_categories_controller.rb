class Api::V1::ProductCategoriesController < ApplicationController
    before_action :set_product_category, only: [:show, :update, :destroy]

    # POST /api/v1/product_categories
    def create
      @product_category = ProductCategory.new(product_category_params)

      if @product_category.save
        render json: @product_category, status: :created
      else
        render json: @product_category.errors, status: :unprocessable_entity
      end
    end

    private

    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    def product_category_params
      params.require(:product_category).permit(:product_id, :category_id)
    end
end
