class OrdersController < ApplicationController
  def index
    # @orders = Order.all
    @item = Item.find(params[:item_id])
  end
end
