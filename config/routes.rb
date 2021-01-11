Rails.application.routes.draw do

  devise_for :users,
    path_names: {
      sign_up: ''
    },
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
  root "items#index"
  resources :users
  resources :items do
    resources :orders
    resources :comments, only: [:create, :destroy]
  end

end

#ルーティングエラー：[POST] "/ users / sign_up"に一致するルートがありません
#→→→ , path_names: {sign_up: ''}でルートを削除

#商品詳細ページから、「idに紐づいた商品レコード」を取得した状態で商品購入画面に遷移するために、ネストを記述(親_idのパラメータを通すには、@item_idをitem.idに変更する必要がある)