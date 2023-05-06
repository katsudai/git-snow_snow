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
      member do
        get 'favorites'
        get 'ranking'
      end
      resources :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings'
      get 'followers' => 'relationships#followers'
    end
    
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      collection do
        get 'search' => 'posts#search'
        get 'ranking' => 'posts#ranking'
      end
      resource  :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create]
    end
    
    
    resources :messages, only: [:create]
    
    resources :rooms, only: [:index, :show, :create]
    
    devise_scope :user do
      post 'guest_sign_in', to: 'sessions#guest_sign_in'
    end
  end
  
  
  # 管理者用
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
        patch 'restoration'
      end
    end
    
    resources :genres, only: [:index, :create, :destroy]
    
    resources :posts, only: [:index, :show, :destroy] do
     resources :post_comments, only: [:destroy]
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
