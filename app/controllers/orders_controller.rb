class OrdersController < ApplicationController
  before_action :itemes_params, only: [:create,:index]
  before_action :move_to_index, only: [:index]
  before_action :authenticate_user!, only: [ :create, :index]

  def index
    @order_address = BuyerOrder.new
  end

  def create
    @order_address = BuyerOrder.new(order_params)
    if @order_address.valid?
       pay_item
      @order_address.save
      return redirect_to root_path
      else 
        render :index
    end
  end 



  
   private

   def order_params
    params.require(:buyer_order).permit(:address, :postal_code, :municipalities, :building_name, :telephone_number, :shipping_area_id).merge(user_id: current_user.id,token: params[:token],item_id:  params[:item_id])
   end

   def move_to_index
    if current_user == @item.user||@item.buyer.present? 
      
 redirect_to root_path
    end
  end

   def itemes_params
    @item = Item.find(params[:item_id])
  end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.product_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      
    end
  
 end