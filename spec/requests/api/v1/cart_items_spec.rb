# spec/controllers/api/v1/cart_items_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::CartItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_params) { { user_id: user.id, product_id: 1, quantity: 1, cart_id: 1 } }
  let(:cart) { create(:cart, user: user) }
  let(:product) { create(:product) }

  before do
    sign_in user
  end

  describe 'POST #create' do
     context 'with valid parameters' do
      it 'creates a new cart item' do
        expect do
          post :create, params: { cart_item: { product_id: product.id, quantity: 1, cart_id: cart.id } }
        end.to change(CartItem, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['product_id']).to eq(product.id)
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable entity status' do
        post :create, params: { cart_item: { product_id: nil, quantity: 1 } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to include("Product can't be blank")
      end
    end
  end

#   describe 'PATCH #update' do
#     let!(:cart_item) { create(:cart_item, cart: cart, product: product, quantity: 1) }

#     context 'with valid parameters' do
#       it 'updates the quantity of the cart item' do
#         patch :update, params: { id: cart_item.id, cart_item: { quantity: 2 } }

#         expect(response).to have_http_status(:ok)
#         expect(cart_item.reload.quantity).to eq(2)
#       end
#     end

#     context 'with invalid parameters' do
#       it 'returns unprocessable entity status' do
#         patch :update, params: { id: cart_item.id, cart_item: { quantity: nil } }

#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(JSON.parse(response.body)['errors']).to include("Quantity can't be blank")
#       end
#     end
#   end


 end
