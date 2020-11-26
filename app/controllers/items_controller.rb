class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
  end

  def new
    # モデルオブジェクト生成
    @item = Item.new
  end

  def create
    # formのデータを受け取る
    @item = Item.new(item_params)
    # バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      # 保存されなければ、newに戻る
      render 'new'
    end
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  # def edit
  # end

  # def update
  #   item = Item.find(params[:id]) #商品idと紐付ける
  #   item.update(item_params)
  # end

  def show
  end

  private

  def item_params
    # ストロングパラメータ
    params.require(:item).permit(:image,:title, :description, :category_id, :status_id, :shipping_charges_id, :from_area_id, :deliver_leadtime_id, :price).merge(user_id: current_user.id)
  end
end
