class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :amount
      t.integer :price
      t.integer :make_status, default: 0

      t.timestamps
    end
  end
end
