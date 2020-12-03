class Product < ApplicationRecord
  # belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_products, dependent: :destroy
 attachment :image
end
