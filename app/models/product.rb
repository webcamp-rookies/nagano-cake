class Product < ApplicationRecord
  # belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_products, dependent: :destroy
 attachment :image
# varidates :genre_id, presence: true,inclusion: {in: 1..4}
# varidates :introduction, presence: true
# varidates :name, presence: true
# varidates :image_id, presence: true
# varidates :price, presence: true
# varidates :is_active, presence: true,inclusion: {in: [true, false]}
end
