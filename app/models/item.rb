class Item < ApplicationRecord
	attachment :image
	belongs_to :genre
	has_many :order_details, dependent: :destroy
	has_many :cart_items, dependent: :destroy

	with_options presence: true do
		validates :name
		validates :detail
		validates :image
		with_options format: { with: /\A[0-9]+\z/ } do
			validates :non_tax_price
		end
	end

	enum is_valid: {
		販売停止中: true,
		販売中: false
	}

end
