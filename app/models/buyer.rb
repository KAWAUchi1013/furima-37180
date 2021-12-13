class Buyer < ApplicationRecord
  belong_to :item
  has_one :order
  belongs_to :user
end
