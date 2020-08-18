class Genre < ApplicationRecord
	validates :name, uniqueness: true
	enum status: {
		true: 0,
		false: 1
	},_prefix: true
end
