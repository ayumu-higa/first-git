Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'toppages#index'
  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :likes
      
    end
  end
  resources :otoiawases, only:[:index, :new, :create] do
    member do
      patch :hensins
      
    end
  end
  resources :usersinnseis, only:[:index,:create]
  resources :ikkatus, only:[:index, :create]
  resources :categories, only:[:index,:show]
  resources :kakikatas, only:[:index]
  resources :kakuninns, only:[:index, :create]
  
  resources :cash, only:[:index, :create]
  resources :discontents, only:[:index, :create, :destroy]
  resources :likes, only:[:create, :destroy]
  
  
end
