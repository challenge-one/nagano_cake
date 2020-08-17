class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
 		t.bigint :customer_id, null: false
		t.bigint :product_id, null: false
		t.integer :number, null: false
      	t.timestamps
    end
  end
end
