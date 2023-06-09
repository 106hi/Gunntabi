Rails.application.routes.draw do
  scope module: :public do
    root to: "homes#top"
    resources :posts, only: %i[new index show edit create destroy update]
  end

  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
