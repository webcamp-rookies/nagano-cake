class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :cart_products, dependent: :destroy
  has_many :products
  has_many :ship_cities, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true
  validates :postcode, format: {with: /\A[0-9]{7}\z/}
  validates :last_name_kana, presence: true, format: {
                  with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
                }
  validates :first_name_kana, presence: true, format: {
                  with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
                }


  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
