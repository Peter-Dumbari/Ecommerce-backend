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

  def checkout
    cart = current_user.cart

    # Ensure the cart exists before proceeding
    if cart.nil? || cart.cart_items.empty?
      render json: { message: 'Your cart is empty, please add item to cart' }, status: :unprocessable_entity
      next
    end

    # Merge the cart_id into order_params
    order_params_with_cart_id = order_params.merge(cart_id: cart.id, user_id: current_user.id)

    # Attempt to create an order and associate the cart directly
    order = Order.new(order_params_with_cart_id)
    order.cart = cart

    # Validate and save the order
    if order.save
      # If the order is saved successfully, create order_items
      cart.cart_items.each do |cart_item|
        order_item = order.order_items.build(product_id: cart_item.product_id, quantity: cart_item.quantity,
                                             cart_id: cart_item.cart_id)
        next if order_item.save

        # Handle errors during order_item creation
        render json: { message: 'There was an error creating the order.', errors: order_item.errors.full_messages },
               status: :unprocessable_entity
        return
      end

      # Clear the cart after successful checkout
      cart.cart_items.destroy_all

      render json: { message: 'Order was successfully created.', order: }, status: :created
    else
      # Handle errors during order creation
      render json: { message: 'There was an error creating the order.', errors: order.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def create
    order = current_user.orders.build(order_params)

    if order.save
      render json: { message: 'Order was successfully created.', order: }, status: :created
    else
      render json: { message: 'There was an error creating the order.', errors: order.errors },
             status: :unprocessable_entity
    end
  end

  # ...

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
    params.require(:order).permit(:order_date, :total_amount, :status, :payment_method, :cart_id,
                                  shipping_address: %i[street city state zip_code])
  end
end
