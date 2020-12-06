class CartProduct < ApplicationRecord
  belongs_to :customer,optional: true
  belongs_to :product,optional: true

  def subtotal
    (amount * product.price * 1.1).floor
  end

end
