Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # root to: "users#home"

  resources :users

  resources :chats do
    collection do
      post :create
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
