class Api::V1::OrderItemsController < ApplicationController
  def create
    order_item = OrderItem.new(order_item_params)

    if order_item.save
      render json: { message: 'Order item created successfully', order_item: }, status: :created
    else
      render json: { errors: order_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :quantity, :subtotal, :cart_id)
  end
end
