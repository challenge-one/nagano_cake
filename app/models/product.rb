class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, through: :cart_items
	has_many :order_items
	has_many :products, through: :order_items
	attachment :image
	validates :name,presence: true,uniqueness: true
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
