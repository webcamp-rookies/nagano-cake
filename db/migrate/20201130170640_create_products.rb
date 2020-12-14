class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.text :introduction
      t.string :name
      t.string :image_id
      t.integer :price
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
