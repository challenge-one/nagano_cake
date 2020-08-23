Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :admin do
    resources :products
    resources :genres, except: [:new,:show,:destroy]
    resources :order_items, only: :update
    resources :orders, only: [:show,:index,:update]
    resources :customers, except: [:new,:create,:destroy]
  end

  namespace :public do
    resource :customers, only: [:show,:edit,:update]
    resources :products, only: [:show,:index]
    resources :deliveries, except: [:new,:show]
    resources :orders, except: [:update,:destroy,:edit]
    resources :cart_items, except: [:new,:edit,:show]
    resources :genres, only: [:show]
    delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  end

  root to: 'public/homes#top'

  # get '/' => 'public/homes#top'=>root_pathに修正
  get 'homes/about' => 'public/homes#about'
  get '/admin' => 'admin/homes#top'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'
  # get 'customers/withdraw' => 'public/customers#withdraw'=>patchに修正
  get 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
