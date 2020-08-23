class Order < ApplicationRecord
	enum status: {
		wait: 0,
		confirmation: 1,
		creating: 2,
		set_delivery: 3,
		deliveried: 4

	}_prefix: true
end
