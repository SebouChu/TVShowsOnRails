Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :shows do
    get 'delete'
    get 'add'
    resources :comments, except: [:index, :show] do
      get 'delete'
    end
  end
  root 'shows#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
