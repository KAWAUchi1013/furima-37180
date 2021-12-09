class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[ :new,:create,:edit]
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

  def update
    @item = Item.find(params[:id])
   if @item.update(itemes_params)
      redirect_to action: :show
  else
    render :edit
  end
  end

  def edit
    @item = Item.find(params[:id])
   if @item.user != current_user
      redirect_to action: :index
  end
  end

  def show
    @item = Item.find(params[:id])
  end

  def itemes_params
    params.require(:item).permit(:product_name,:image, :description_of_item, :category_id, :product_condition_id,:burden_of_shipping_charge_id,:shipping_area_id,:days_to_ship_id,:product_price).merge(user_id: current_user.id)
  end
end
