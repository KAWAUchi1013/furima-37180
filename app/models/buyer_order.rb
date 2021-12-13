class BuyerOrder

  include ActiveModel::Model
  attr_accessor :token,:price,:address,:postal_code, :municipalities, :building_name, :telephone_number, :buyer, :shipping_area_id,:user_id,:item_id
  with_options presence: true  do
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
  validates :postal_code,format: { with: VALID_POSTAL_CODE_REGEX }
  validates :municipalities
  validates :item_id
  validates :shipping_area_id,numericality: { other_than: 0 }
  validates :user_id
  validates :token
  validates :address
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :telephone_number,format: { with: VALID_PHONE_REGEX }
  end
  def save
      buyer = Buyer.create(item_id: item_id, user_id: user_id)
      Order.create(address: address, postal_code: postal_code, municipalities: municipalities, building_name: building_name, telephone_number: telephone_number,buyer_id: buyer.id,shipping_area_id: shipping_area_id)
    end

end