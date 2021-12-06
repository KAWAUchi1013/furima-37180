class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :burden_of_shipping_charges
  belongs_to :product_condition
  belongs_to :days_to_ship
  belongs_to :category
  belongs_to :area
  validates:product_name presence: true
  validates:description_of_item presence: true
  validates:product_price presence: true
  validates:product_condition_id presence: true
  validates:burden_of_shipping_charge_id presence: true
  validates:shipping_area_id presence: true
  validates:days_to_ship_id presence: true
  validates:category_id presence: true
  validates:user presence: true
end
