class Genre < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :name, uniqueness: true
	enum status: {
		 true: 0,
		 false: 1
	},_prefix: true
end
