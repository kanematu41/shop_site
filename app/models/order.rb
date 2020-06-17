class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_detail, dependent: :destroy

	with_options presence: true do
		validates :address
		validates :direction
		with_options format: { with: /\A\d{7}\z/ } do
			validates :postcode
		end
	end

	enum pay_type: {
		クレジットカード: 0,
		銀行振込: 1
	}
end
