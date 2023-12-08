class Api::V1::OrderItemsController < ApplicationController
    def create
      order_item = OrderItem.new(order_item_params)
  
      if order_item.save
        render json: { message: 'item added to order succesfully', order_item: order_item }, status: :created      
       else
        render json: { errors: order_item.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
        order_item = OrderItem.find(params[:id])
        if order_item.destroy
          render json: { message: 'Item removed successfully from order' }, status: :ok
        else
          render json: { error: 'Failed to delete item', details: order_item.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    private
  
    def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :quantity, :subtotal)
    end
  end
  