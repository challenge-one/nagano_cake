class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
    	t.bigint :customer_id, null: false
    	t.string :postcode, null: false
    	t.string :address, null: false
    	t.string :addressee, null: false
      	t.timestamps
    end
  end
end
