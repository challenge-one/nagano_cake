class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, :through => :order_items
  accepts_nested_attributes_for :order_items
  belongs_to :customer
  enum status: {
		wait: 0,
		confirmation: 1,
		creating: 2,
		set_delivery: 3,
		deliveried: 4

  }_prefix: true

end
