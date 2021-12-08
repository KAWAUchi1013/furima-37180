class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[ :new,:create]
  def index
    @items = Item.all.order("created_at DESC")
  end
  def create
    @item = Item.new(itemes_params)
 if @item.save
   redirect_to root_path
 else
   render :new
 end
end
  def new
    @item = Item.new
  end

  def itemes_params
    params.require(:item).permit(:product_name,:image, :description_of_item, :category_id, :product_condition_id,:burden_of_shipping_charge_id,:shipping_area_id,:days_to_ship_id,:product_price).merge(user_id: current_user.id)
  end
end
