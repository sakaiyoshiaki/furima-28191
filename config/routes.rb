Rails.application.routes.draw do

  devise_for :users,
    path_names: {
      sign_up: ''
    },
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
  root to: 'items#index'
  resources :users

end

#[POST] "/ users / sign_up"に一致するルートがありません
#→ , path_names: {sign_up: ''}でルートを削除
#root "items#index"