class Api::V1::OrdersController < ApplicationController
  # GET /api/v1/orders
  def index
    order = current_user.orders.includes(:cart_items)
    render json: order, include: [:cart_items]
  end

  # GET /api/v1/users/:user_id/orders/1
  def show
    order = current_user.orders.find(params[:id])
    render json: order
  end

#   def create
#     order = current_user.orders.build(order_params)

#     if order.save
#       render json: { message: 'Order was successfully created.', order: }, status: :created
#     else
#       render json: { message: 'There was an error creating the order.', errors: order.errors },
#              status: :unprocessable_entity
#     end
#   end


def checkout
    cart_items = current_user.cart.cart_items.includes(:product)
    
    order = current_user.orders.create(order_date: Time.now)
    total_amount = 0

    cart_items.each do |cart_item|
      order_item = order.order_items.create(
        product: cart_item.product,
        quantity: cart_item.quantity,
        subtotal: cart_item.quantity * cart_item.product.price
      )

      total_amount += order_item.subtotal
    end

    order.update(total_amount: total_amount, status: 'pending')

    current_user.cart.cart_items.clear

    render json: { message: 'Checkout successful', order: order }, status: :created
end


def update
    order = Order.find(params[:id])

    if order.update(order_params)
      render json: { message: 'Order successfully updated' }, status: :ok
    else
      render json: { error: 'Failed to update order', details: order.errors.full_messages },
             status: :unprocessable_entity
    end
end

  def destroy
    order = Order.find(params[:id])
    if order.destroy
      render json: { message: 'Order successfully deleted' }, status: :ok
    else
      render json: { error: 'Failed to delete order', details: order.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_date, :total_amount, :status,
                                  order_items_attributes: %i[product_id quantity])
  end
end
