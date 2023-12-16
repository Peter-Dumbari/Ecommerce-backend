class Api::V1::CartsController < ApplicationController
    before_action :authenticate_user!

    def show
        cart = current_user.cart || current_user.create_cart
        @cart_items = cart.cart_items.includes(:product)
        render json: { cart: cart, cart_items: @cart_items }
    end
end
