class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy

  has_many :depositories

  has_one :payment

  has_many :depository_additions, through: :depositories, source: :products

  def subscribed?
    stripe_subscription_id
  end

end
