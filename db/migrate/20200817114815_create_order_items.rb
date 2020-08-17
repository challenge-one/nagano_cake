class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
	t.bigint :order_id, null: false
	t.bigint :product_id, null: false
	t.integer :number, null: false
	t.integer :purchased_price, null: false
	t.integer :status, null: false, default: 0
    t.timestamps
    end
  end
end
