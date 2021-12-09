class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :edit_show_update, only: [:edit, :show, :update]
  def index
    @items = Item.all.order('created_at DESC')
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
    if @item.update(itemes_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def edit
    redirect_to action: :index if @item.user != current_user
  end

  def show
  end

private

  def edit_show_update_destroy
    @item = Item.find(params[:id])
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def itemes_params
    params.require(:item).permit(:product_name, :image, :description_of_item, :category_id, :product_condition_id,
                                 :burden_of_shipping_charge_id, :shipping_area_id, :days_to_ship_id, :product_price).merge(user_id: current_user.id)
  end
end
