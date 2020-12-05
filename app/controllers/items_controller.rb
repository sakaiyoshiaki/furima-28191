class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: :edit

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
    # 出品された商品データのidから商品レコードを取得する
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  def edit
    # 編集前の商品情報を表示する
  end

  def update
    # バリデーションで問題がなければ更新され、商品詳細画面に遷移する。問題があれば更新されず、「商品編集画面」(/edit)に戻る。
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    # ストロングパラメータ
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :shipping_charge_id, :from_area_id, :deliver_leadtime_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    # 共通処理(idに紐づいた商品レコードの取得)を定義し、アクション前に実行
    @item = Item.find(params[:id])
  end

  def move_to_index
    # 出品者のみ、自分の商品の編集画面に直接URLからアクセスできる。出品者以外はトップページに遷移。未ログイン時はログイン画面に遷移。
    if user_signed_in? && current_user.id == @item.user_id
      render :edit
    else
      redirect_to root_path
    end
  end
end
