class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_details, dependent: :destroy

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

	enum order_status: {
		入金待ち: 0,
		入金確認: 1,
		製作中: 2,
		発送準備中: 3,
		発送済み: 4
	}
end
