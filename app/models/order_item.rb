class OrderItem < ApplicationRecord
	enum status: {
		wait: 0,
		create_wait: 1,
		creating: 2,
		created: 3
	}_prefix: true
end
