Clankeithusa::Application.routes.draw do

  post "product/add_to_cart" => "products#add_to_cart"
  post "cart/empty_cart" => "cart#empty_cart"
  post "cart/remove_item" => "cart#remove_item"
  get 'comments/:id/approve' => 'comments#approve'
  match "order/payment" => "orders#payment"
  get "cart" => "cart#show", as: "cart"
  match "join" => "join#new", as: "join", via: :get
  match "join" => "join#create", as: "join", via: :post
  get "log_in" => "user_sessions#new", as: "log_in"
  get "log_out" => "user_sessions#destroy", as: "log_out"

  resource :join
  resources :comments
  resources :users
  resources :images
  resources :events
  resources :user_sessions
  resources :announcements
  resources :documents
  resources :products
  resources :orders

  root to: 'home#index'

  resources :pages, only: [:new, :create, :index] do
    resources :images
    resources :blurbs
    resources :documents
  end

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug
end
