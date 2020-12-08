class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

   enum payment: {クレジットカード:0, 銀行振込:1}

   enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  def self.cart_products_total_price(cart_products)
    array = []
    cart_products.each do |cart_product|
      array << cart_product.product.price * cart_product.amount
    end
    return (array.sum * 1.1).floor
  end

end
