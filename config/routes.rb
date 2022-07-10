Rails.application.routes.draw do
  root to: "public/homes#top"
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :items
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/quit'
  end
  namespace :public do
    get 'items/index'
  end
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
  
  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
