class ShipCity < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :postcode, presence: true, length: {maximum: 7}, numericality: { only_integer: true }
end
