Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :items  do
<<<<<<< HEAD
    resources :orders, only:[:create,:index]
=======
    
>>>>>>> parent of c7c6f4e (購入機能実装)
    end
  end





