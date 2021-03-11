class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        @order_address.save
        redirect_to root_path
      else
        redirect_to item_orders_path
      end
  end

  private


  def order_params
    params.require(:order_address).permit(:postcode,:city,:phone_number,:prefecture_id,:area).merge(item_id: params[:item_id],user_id: current_user.id )
  end
end
