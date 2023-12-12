# app/controllers/api/v1/carts_controller.rb
class Api::V1::CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @cart_items = @cart.cart_items
    render json: { cart: @cart, cart_items: @cart_items }
  end
end
