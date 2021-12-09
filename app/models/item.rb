class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :burden_of_shipping_charge
  belongs_to :product_condition
  belongs_to :days_to_ship
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :user
  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :product_price, presence: true
  validates :product_condition_id, presence: true
  validates :burden_of_shipping_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :category_id, presence: true
  validates :product_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :days_to_ship_id
    validates :shipping_area_id
    validates :burden_of_shipping_charge_id
    validates :product_condition_id
  end
end
