class CartProduct < ApplicationRecord
    belongs_to :product
    belongs_to :cuustomer
end
