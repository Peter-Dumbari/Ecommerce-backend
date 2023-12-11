class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :orders
  has_one :cart # Assuming you want to destroy the cart when the user is destroyed  

  validates :name, presence: true, length: { in: 3..25 }
  enum role: { user: 'user', admin: 'admin' }

  after_create :create_user_cart

  private

  def create_user_cart
   create_cart
  save
  end
end
