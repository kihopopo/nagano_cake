Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top'
    #get '/orders/:id', to:"orders#show"
   # patch '/orders/:id', to:"orders#update"
  end


  namespace :admin do
    resources :orders
    resources :genres
    resources :items
    resources :customers
    resources :order_details
  end


  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: "public/homes#top"
  get '/about' => 'public/homes#about'


  scope module: :public do
    resources :addresses
    resources :items
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :orders
  end

  get 'customers/my_page' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
