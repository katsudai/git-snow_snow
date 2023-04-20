Rails.application.routes.draw do
  
  # 顧客用
  devise_for :users, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    
    resources :users, only: [:show, :edit, :update] do
     resources :relationships, only: [:create, :destroy]
     get 'relationships/followings' => 'relationships#followings'
     get 'relationships/followers' => 'relationships#followers'
    end
    
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      resource  :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    
    resources :messages, only: [:create]
    
    resources :rooms, only: [:index, :show, :create]
  end
  
  
  
  # 管理者用
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    get 'users/unsubscribe' => 'users#unsubscribe'
    get 'users/withdraw' => 'users#withdraw'
    
    resources :genres, only: [:index, :create, :destroy]
    
    resources :posts, only: [:index, :show, :destroy]
    
    resources :post_comments, only: [:destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
