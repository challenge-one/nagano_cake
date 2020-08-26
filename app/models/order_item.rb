class OrderItem < ApplicationRecord
	belongs_to :product
	belongs_to :order
	enum status: {
		着手不可: 0,
		制作待ち: 1,
		制作中: 2,
		制作完了: 3,
	}

	def item_create
		self.order.update(status: "制作中")
	end
	
	def item_create_complete
		self.order.update(status: "発送準備中")
	end
end
