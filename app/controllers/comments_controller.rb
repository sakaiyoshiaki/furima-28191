class CommentsController < ApplicationController

  # def new
  #   @comments = Comment.all
  #   @comment = Comment.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
      redirect_to item_path(@item)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    # 遷移元のURLを取得して商品詳細ページにリダイレクトする
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
