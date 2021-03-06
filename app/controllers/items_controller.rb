class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:index, :search,:show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = @p.result
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :burden_id, :prefecture_id, :days_to_ship_id,
                                 :item_description, images:[]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless @item.user.id == current_user.id && @item.order.blank?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])
  end
end
