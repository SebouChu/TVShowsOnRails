Rails.application.routes.draw do
  devise_for :users
  resources :shows do
    get 'delete'
    get 'add'
  end
  root 'shows#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
