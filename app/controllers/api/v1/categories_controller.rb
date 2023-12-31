class Api::V1::CategoriesController < ApplicationController
  # GET /api/v1/categories
  def index
    @categories = Category.all
    render json: @categories
  end

  # GET /api/v1/categories/:id
  def show
    render json: @category
  end

  # POST /api/v1/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/categories/:id
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/categories/:id
  def destroy
    @category.destroy
    render json: { message: 'Category deleted successfully' }, status: :ok
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
