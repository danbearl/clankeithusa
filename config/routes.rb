Clankeithusa::Application.routes.draw do
  get "log_in" => "user_sessions#new", as: "log_in"
  get "log_out" => "user_sessions#destroy", as: "log_out"

  resources :users
  resources :images
  resources :events
  resources :user_sessions
  resources :announcements

  root :to => 'home#index'

  resources :pages, only: [:new, :create, :index] do
    resources :images
    resources :blurbs
  end

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug
end
