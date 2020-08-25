module ApplicationHelper
	def price_include_tax(price)
		price = price * 1.10
		price.floor(0)
	end
end
