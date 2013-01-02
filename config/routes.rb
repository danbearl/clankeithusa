Clankeithusa::Application.routes.draw do
  resources :images

  root :to => 'pages#index'

  resources :pages, only: [:new, :create, :index] do
    resources :images
  end

  resources :events

  resources :images

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug
end
