class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
	t.bigint :customer_id, null: false
	t.integer :cash_method, null: false, default: 0
	t.integer :postage, null: false, default: 800
	t.integer :total_amount, null: false
	t.integer :status, null: false, default: 0
	t.string :addressee, null: false
	t.string :postcode, null: false
	t.string :address, null: false
    t.timestamps
    end
  end
end
