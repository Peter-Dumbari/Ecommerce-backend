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
    params.require(:order).permit(:order_date, :total_amount, :status,
                                  order_items_attributes: %i[product_id quantity])
  end
end
