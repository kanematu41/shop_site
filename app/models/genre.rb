class Genre < ApplicationRecord
	has_many :items, dependent: :destroy

	validates :name, presence: true

	enum is_valid: {
		有効: true,
		無効: false
	}
end
