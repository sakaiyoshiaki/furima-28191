class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    # 入力フォームのデータを受け取り、入力値に問題がなければ保存する
    @order = Order.new(order_params)
    # バリデーションで問題がなければ保存され、トップページに遷移する。問題があれば保存はされず、「商品購入画面」(/new)に戻る。
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def order_params
    # ストロングパラメータ
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id)
  end

end
