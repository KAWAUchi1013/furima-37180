class OrdersController < ApplicationController

  def index
    @order_address = BuyerOrder.new
  end

  def create
    @order_address = BuyerOrder.new(order_params)
    if @order_address.valid?
      # pay_item
      @order_address.save
      return redirect_to root_path
    end
  end  
  
   private

   def order_params
    params.require(:buyer_order).permit(:price,:address, :postal_code, :municipalities, :building_name, :telephone_number, :shipping_area_id).merge(user_id: current_user.id,item_id:  params[:item_id])
   end
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      
    end
  
 end