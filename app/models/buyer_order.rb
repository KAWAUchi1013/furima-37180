class BuyerOrder

  include ActiveModel::Model
  attr_accessor :price, :address,:postal_code, :municipalities, :building_name, :telephone_number, :buyer, :shipping_area_id,:user_id,:item_id

  # validates :price,presence: true
  validates :postal_code,presence: true
  validates :municipalities,presence: true
  # validates :building_name,presence: true
  validates :telephone_number,presence: true
  # validates :buyer,presence: true
  validates :shipping_area_id,presence: true
  validates :user_id,presence: true
  validates :item_id,presence: true
  def save
      # 寄付情報を保存し、変数donationに代入する
      buyer = Buyer.create(item_id: item_id, user_id: user_id)
      # 住所を保存する
      # donation_idには、変数donationのidと指定する
      Order.create(address: address, postal_code: postal_code, municipalities: municipalities, building_name: building_name, telephone_number: telephone_number,buyer_id: buyer.id,shipping_area_id: shipping_area_id)
    end

end