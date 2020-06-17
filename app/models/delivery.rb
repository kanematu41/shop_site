class Delivery < ApplicationRecord
	belongs_to :end_user

	with_options presence: true do
		validates :address
		validates :direction
		with_options format: { with: /\A\d{7}\z/ } do
			validates :postcode
		end
	end

	def full_address
		self.postcode + self.address + self.direction
	end
end
