class ItemsController < ApplicationController

  def index
  end

  def new
    if current_user
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
  end
end
