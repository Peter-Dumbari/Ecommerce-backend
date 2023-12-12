# app/controllers/api/v1/cart_items_controller.rb
class Api::V1::CartItemsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @cart = current_user.cart || current_user.create_cart
      @cart_item = @cart.cart_items.new(cart_item_params)

      @cart_item.user_id = current_user.id
  
      if @cart_item.save
        render json: @cart_item, status: :created
      else
        render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      @cart_item = current_user.cart.cart_items.find(params[:id])
  
      if @cart_item.update(cart_item_params)
        render json: @cart_item
      else
        render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @cart_item = current_user.cart.cart_items.find(params[:id])
      @cart_item.destroy
      head :no_content
    end
  
    private
  
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end
  end
  