class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  # has_many :cart_products, dependent: :destroy
  attachment :image

  # validates :name, presence: true
  # validates :introduction, presence: true
  # validates :price, presence: true
end
