class OrdersController < ApplicationController

  def index
    # @orders = Order.all
    @items = Item.all
  end

end