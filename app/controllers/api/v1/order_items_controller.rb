class Api::V1::OrderItemsController < ApplicationController
    def create
      order = Order.find_or_create_by(cart_id: params[:cart_id], user_id: params[:user_id])
      order_item = order.order_items.new(order_item_params)
  
      if order_item.save
        render json: { message: 'Item added to order successfully', order_item: order_item }, status: :created
      else
        render json: { errors: order_item.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity, :subtotal)
    end
  end
  