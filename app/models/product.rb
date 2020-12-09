class Product < ApplicationRecord

  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  
  has_many :orders, through: :order_details
  
  attachment :image
  
  validates :genre_id, presence: true
  validates :introduction, presence: true
  validates :name, presence: true
  validates :image_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true,inclusion: {in: [true, false]}
end
