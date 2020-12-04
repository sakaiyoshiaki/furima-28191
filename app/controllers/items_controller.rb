class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    # 全ての商品レコードを含んだインスタンス変数を生成し、出品順に並び替える
    @items = Item.order('created_at DESC')
  end

  def new
    # itemモデルオブジェクトを生成する
    @item = Item.new
  end

  def create
    # 入力フォームのデータを受け取り、入力値に問題がなければ保存する
    @item = Item.new(item_params)
    # バリデーションで問題がなければ保存され、トップページに遷移する。問題があれば保存はされず、「商品入力画面」(/new)に戻る。
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    # 出品された商品データのidを検索する
    @item = Item.find(params[:id])
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if Item.update(item_params)
      redirect_to item_path #商品詳細画面に遷移
    else
      render :edit
    end
  end

  private

  def item_params
    # ストロングパラメータ
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :shipping_charge_id, :from_area_id, :deliver_leadtime_id, :price).merge(user_id: current_user.id)
  end

  # def was_attached?
  #   self.image.attached?
  # end
end
