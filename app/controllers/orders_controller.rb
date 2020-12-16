class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @orders = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    # 入力フォームのデータを受け取り、入力値に問題がなければ保存する
    @order = Order.new(order_params)
    # バリデーションで問題がなければ保存され、トップページに遷移する。問題があれば保存はされず、「商品購入画面」(/items/item_id/orders)に戻る。
    if @order.valid?
      # pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    # ストロングパラメータ #:order_purchaseモデルはどこ？？
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel)
  end

  # def pay_item
  #   @item = Item.find(params[:item_id])
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     amount: @item.price,  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency:'jpy'                 # 通貨の種類(日本円)
  #   )
  # end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
