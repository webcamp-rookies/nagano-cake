class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping
      t.integer :total_fee
      t.integer :payment, default: 0
      t.integer :status, default: 0
      t.string :name
      t.string :postcode
      t.string :city
      t.timestamps
    end
  end
end
