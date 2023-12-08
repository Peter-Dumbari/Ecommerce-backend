class Api::V1::OrdersController < ApplicationController
  # GET /api/v1/orders
  def index
    order = current_user.orders.includes(:product)
    render json: order, include: [:product]
  end

  # GET /api/v1/users/:user_id/orders/1
  def show
    order = current_user.orders.find(params[:id])
    render json: order
  end

  # POST /api/v1/users/:user_id/orders

  def create
    existing_order = current_user.orders.find_by(order_params)
    if existing_order
      render json: { status: 'error', message: 'order Already exists' }, status: :unprocessable_entity
    else

      @order = current_user.orders.new(order_params)

      if @order.save
        render json: { status: 'Success', message: 'Order created successfully' }, status: :created
      else
        puts @order.errors.full_messages
        render json: { status: 'error', message: @order.errors.full_messages.to_s,
                       errors: @order.errors.full_messages },
               status: :unprocessable_entity
      end
    end
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
    params.require(:order).permit(:order_date, :total_amount, :status, :product_id)
  end
end
