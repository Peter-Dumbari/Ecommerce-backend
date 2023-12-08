class Api::V1::CartsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cart, only: [:show, :update, :destroy]
  
    def show
      render json: @cart, include: :cart_items
    end
  
    def create
      cart = current_user.build_cart
      if cart.save
        render json: cart, status: :created
      else
        render json: { errors: cart.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @cart.update(cart_params)
        render json: @cart
      else
        render json: { errors: @cart.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @cart.destroy
      head :no_content
    end
  
    private
  
    def set_cart
      @cart = current_user.cart
    end
  
    def cart_params
      params.require(:cart).permit(:user_id)
    end
  end
  