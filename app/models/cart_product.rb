class CartProduct < ApplicationRecord
    belongs_to :product, optional: true
    belongs_to :customer, optional: true

    def sub_total
    (product.price * amount * 1.1).floor
    end

    def self.cart_products_total_price(cart_products)
    array = []
    cart_products.each do |cart_product|
      array << cart_product.product.price * cart_product.amount
    end
    return (array.sum * 1.1).floor
    end

end
