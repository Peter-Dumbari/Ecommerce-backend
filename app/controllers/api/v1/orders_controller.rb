class Api::V1::OrdersController < ApplicationController
    before_action :set_user
    before_action :set_order, only: [:show, :update, :destroy]
    authorize_resource

    # GET /api/v1/orders
    def index
        @orders = @user.orders
        render json: @orders
    end

     # GET /api/v1/users/:user_id/orders/1
    def show
        render json: @order
    end

    # POST /api/v1/users/:user_id/orders
    def create
        @order = @user.orders.new(order_params)

        if @order.save
        render json: @order, message: "Order added to chart", status: :created
        else
        render json: @order.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /api/v1/users/:user_id/orders/1

    def update
        if @order.update(order_params)
        render json: @order
        else
        render json: @order.errors, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/users/:user_id/orders/1
    def destroy
        if @order.destroy
        render json: {message: "Order deleted successfully"}
        else
        render json: @order.errors, status: :unprocessable_entity
        end
    end

    private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_order
    @order = @user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_date, :total_amount)  
  end
end
