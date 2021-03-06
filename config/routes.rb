Rails.application.routes.draw do


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :reservations, only: [:show]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :transactions, only: [:new, :create]

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

   get "/auth/:prvider/callback" => "sessions#create_from_omniauth"

# resources users ::::: show alll th routes
  get "/user" => "users#show", as: "user_profile"

  # You can have the root of your site routed with "root"
  root "listings#index"

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :listings do
    resources :reservations , except: :show
    collection do
      get :autocomplete
    end
  end

  resources :reservations, only: [] do
    resources :transactions, only: [:new, :create]
  end

  # resources :reservations do
  #   resources :transactions, only: [:new, :create]
  # end

  get "/my_listings", to: "listings#my_listings" , as: "my_listings"
  get "/my_reservations", to: "reservations#my_reservations", as: "my_reservations"

  get "/search", to: "listings#search_listings", as: "search_listings"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
