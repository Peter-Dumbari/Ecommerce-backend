class Api::V1::CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :set_cart_item, only: [:update, :destroy]
  def create
    # Find or create a cart for the current user
    cart = current_user.cart || current_user.create_cart

    # Build a new cart item
    cart_item = cart.cart_items.build(cart_item_params)

    if cart_item.save
      render json: { message: 'Cart item added successfully' }, status: :created
    else
      render json: { errors: cart_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item.destroy
    head :no_content
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def set_cart_item
    @cart_item = @cart.cart_item.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
  end
end
