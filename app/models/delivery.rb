class Delivery < ApplicationRecord
 belongs_to :customer
	validates :postcode, presence: true
	validates :address, presence: true
	validates :addressee, presence: true

end
