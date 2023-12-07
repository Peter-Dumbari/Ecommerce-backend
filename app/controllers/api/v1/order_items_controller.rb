class Api::V1::OrderItemsController < ApplicationController
    def create
        order_item = OrderItem.create(order_item_params)
        render json: order_item, status: :created
      end

      private

      def order_item_params
        params.require(:order_item).permit(:order_id, :product_id, :quantity, :unit_price)
      end
end
