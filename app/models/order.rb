class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, :through => :order_items
  accepts_nested_attributes_for :order_items
  belongs_to :customer
  enum cash_method: {クレジットカード:0, 銀行振込:1}
  enum status: {
    入金待ち: 0,
    入金確認: 1,
    制作中: 2,
    発送準備中: 3,
    発送済み: 4
  },_prefix: true

end
