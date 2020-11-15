class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    #バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      #保存されなければ、newに戻る
      render 'new'
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id]) #商品idと紐付ける
    item.update(item_params)
  end

  def show
  end

  #create,updateアクションの引数では、
  #ストロングパラメータ items_paramasの記述が必要。
  private
  def item_params
    params.require(:item).permit(:title,:description,:category_id,:status_id,:shipping_charges_id,:from_area_id,:deliver_leadtime_id,:price).merge(user_id: current_user.id)
  end

end