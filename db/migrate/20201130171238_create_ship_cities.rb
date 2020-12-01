class CreateShipCities < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_cities do |t|
      t.integer :customer_id
      t.string :name
      t.string :postcode
      t.string :city

      t.timestamps
    end
  end
end
