Rails.application.routes.draw do
  namespace :admin do
    get 'post_comments/index'
  end
  namespace :admin do
    get 'posts/show'
  end
  namespace :admin do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    resources :posts, only: %i[new index show edit create destroy update] do
      resource :favorites, only: %i[create destroy]
      resources :post_comments, only: %i[create destroy]
    end
    resources :customers, only: %i[show edit update destroy] do
      member do
        get :favorites
      end
    end
    resources :tags do
      get 'posts', to: 'posts#search'
    end
  end

  namespace :admin do
    get "/" => "homes#top"
    resources :customers, only: %i[show edit update destroy]
    resources :posts, only: %i[show]
    resources :post_comments, only: %i[index destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
