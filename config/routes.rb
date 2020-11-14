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
  resources :items
end

#[POST] "/ users / sign_up"に一致するルートがありません
#→ , path_names: {sign_up: ''}でルートを削除