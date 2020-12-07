class Order < ApplicationRecord
  belongs_to :customer

   enum payment: {クレジットカード:0, 銀行振込:1}

  def self.cart_products_total_price(cart_products)
    array = []
    cart_products.each do |cart_product|
      array << cart_product.product.price * cart_product.amount
    end
    return (array.sum * 1.1).floor
  end

end
