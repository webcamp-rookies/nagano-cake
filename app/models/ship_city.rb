class ShipCity < ApplicationRecord
  belongs_to :customer

  validates :name, :city, presence: true
  validates :postcode, length: {maximum: 7}, numericality: { only_integer: true }
end
