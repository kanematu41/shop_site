class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  with_options presence: true do
  	validates :first_name
  	validates :last_name
  	validates :address
  	with_options format: {with: /\A[ァ-ヶー－]+\z/} do
  		validates :first_kana_name
  		validates :last_kana_name
  	end
  	with_options format: { with: /\A\d{7}\z/ } do
  		validates :postcode
    end
    with_options format: { with: /\A\d{11}\z/ } do
  		validates :phone_number
  	end
  end

end
