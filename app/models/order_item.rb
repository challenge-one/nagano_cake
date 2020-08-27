class OrderItem < ApplicationRecord
	belongs_to :product
	belongs_to :order
	enum status: {
		着手不可: 0,
		制作待ち: 1,
		制作中: 2,
		制作完了: 3,
	}

	def creating
		self.status.update(order_item: "creating")
	end

	def created
		self.status.update(order_item: "set_delivery")
	end

end
