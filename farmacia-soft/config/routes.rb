Rails.application.routes.draw do
        # Root path
          root to: "sessions/sessions#new"
       # Sessions
          get 'login' => 'sessions/sessions#new', as: 'sign_in'
          post '/login' => 'sessions/sessions#create', as: 'sign_in_user'
          match 'logout' => 'sessions/sessions#destroy',:via => [:delete], as: 'sign_out'
        # dashboard
         get '/dashboard' => 'dashboard/dashboard#index', as: 'dashboard'
         # Users
          get '/registrarse' => 'users/users#new', as: 'sign_up'
          post '/registrarse' => 'users/users#create', as: 'sign_up_user'
          get 'user/:id/edit' => 'users/users#edit', as: 'edit_user'
          put '/user/:id' => 'users/users#update', as: 'update_user'
          get 'user/:id/show' => 'users/users#show', as: 'user_show'
          delete '/user/:id' => 'users/users#destroy', as: 'destroy_user'
          get 'users/index' => 'users/users#index', as: 'index' 
          # Customer
          get '/customer/new' => 'customers/customers#new', as: 'customer_new'
          post '/customer' => 'customers/customers#create', as: 'customer_create'
          get 'customer/:id/edit' => 'customers/customers#edit', as: 'edit_customer'
          put '/customer/:id' => 'customers/customers#update', as: 'update_customer'
          delete '/customer/:id' => 'customers/customers#destroy', as: 'destroy_customer'
          get 'customers/index' => 'customers/customers#index', as: 'customer_index' 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end