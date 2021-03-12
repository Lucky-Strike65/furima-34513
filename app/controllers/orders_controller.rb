class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    if current_user.id != @item.user_id
    @order_address = OrderAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        pay_item
        @order_address.save
        redirect_to root_path
      else
        redirect_to item_orders_path
      end
  end

  private


  def order_params
    params.require(:order_address).permit(:postcode,:city,:phone_number,:prefecture_id,:area).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    binding.pry
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
