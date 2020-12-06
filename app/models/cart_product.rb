class CartProduct < ApplicationRecord
    belongs_to :product, optional: true
    belongs_to :customer, optional: true
    
        def sub_total
        product.price * amount
        end

end
