class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	attachment :image
	validates :name,presence: true
	validates :introduction,presence: true
	validates :price,presence: true
	validates :status,presence: true
	validates :genre,presence: true
	validates :image,presence: true
	enum status: {
		 true: 0,
		 false: 1
	},_prefix: true
end
