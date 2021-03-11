class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
  end

  private


  def order_params
    params.require(:order_address).permit.(:order_id,:postcode,:city,:phone_number,:prefecture_id,:area).merge(:item_id, :@item.id)
  end
end
