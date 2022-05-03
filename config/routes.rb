Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :items, only:[:new,:create]do
    resources :purchases,only:[:new,:create]    
  end
end




