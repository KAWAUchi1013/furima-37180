class BuyerOrder

  include ActiveModel::Model
  attr_accessor :token,:price,:address,:postal_code, :municipalities, :building_name, :telephone_number, :buyer, :shipping_area_id,:user_id,:item_id

  validates :postal_code,presence: true
  validates :municipalities,presence: true
  validates :telephone_number,presence: true
  validates :item_id,presence: true
  validates :shipping_area_id,presence: true
  validates :user_id,presence: true
  validates :token,presence: true
  def save
      buyer = Buyer.create(item_id: item_id, user_id: user_id)
      Order.create(address: address, postal_code: postal_code, municipalities: municipalities, building_name: building_name, telephone_number: telephone_number,buyer_id: buyer.id,shipping_area_id: shipping_area_id)
    end

end