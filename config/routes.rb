Clankeithusa::Application.routes.draw do

  post "product/add_to_cart" => "products#add_to_cart"
  post "cart/empty_cart" => "cart#empty_cart"
  post "cart/remove_item" => "cart#remove_item"
  get 'comments/:id/approve' => 'comments#approve'
  match "order/payment" => "orders#payment"
  get "cart" => "cart#show", as: "cart"
  match "join" => "applicants#new", as: "join", via: :get
  match "join" => "applicants#create", as: "join", via: :post
  get "log_in" => "user_sessions#new", as: "log_in"
  get "log_out" => "user_sessions#destroy", as: "log_out"
  get "applicants/:id/approve" => 'applicants#approve'
  get "applicants/:id/process_applicant" => 'applicants#process_applicant'

  resources :announcements
  resources :applicants
  resources :blurb_associations
  resources :blurbs
  resources :comments
  resources :documents
  resources :events
  resources :images
  resources :orders
  resources :products
  resources :user_sessions
  resources :users

  root to: 'home#index'

  resources :pages, only: [:new, :create, :index] do
    resources :images
    resources :blurb_associations
    resources :documents
  end

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug
end
