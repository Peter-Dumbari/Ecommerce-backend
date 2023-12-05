class User < ApplicationRecord
  # include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :set_default_role



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :jwt_authenticatable, jwt_revocation_strategy: self

         has_many :others

         validates :name, presence: true, length: { in: 3..25 }


         private

  def set_default_role
    self.role ||= "user" if role.nil?
  end
end
