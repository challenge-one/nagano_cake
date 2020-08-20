class Product < ApplicationRecord
	belongs_to :genre
	attachment :image
	enum status: {
		 true: 0,
		 false: 1
	},_prefix: true
end
