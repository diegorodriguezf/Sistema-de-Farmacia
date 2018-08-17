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
          # cliente
          get '/cliente/new' => 'clientes/clientes#new', as: 'cliente_new'
          post '/cliente' => 'clientes/clientes#create', as: 'cliente_create'
          get 'cliente/:id/edit' => 'clientes/clientes#edit', as: 'edit_cliente'
          put '/cliente/:id' => 'clientes/clientes#update', as: 'update_cliente'
          delete '/cliente/:id' => 'clientes/clientes#destroy', as: 'destroy_cliente'
          get 'clientes/index' => 'clientes/clientes#index', as: 'cliente_index' 
          # Timbrado
          get '/timbrado/new' => 'timbrados/timbrados#new', as: 'timbrado_new'
          post '/timbrado' => 'timbrados/timbrados#create', as: 'timbrado_create'
          get 'timbrado/:id/edit' => 'timbrados/timbrados#edit', as: 'edit_timbrado'
          put '/timbrado/:id' => 'timbrados/timbrados#update', as: 'update_timbrado'
          get 'timbrado/:id/show' => 'timbrados/timbrados#show', as: 'timbrado_show'
          delete '/timbrado/:id' => 'timbrados/timbrados#destroy', as: 'destroy_timbrado'
          get 'timbrados/index' => 'timbrados/timbrados#index', as: 'timbrado_index' 
          # Configuracion
          get 'configuracion/:id/edit' => 'configuraciones/configuraciones#edit', as: 'edit_configuracion'
          put '/configuracion/:id' => 'configuraciones/configuraciones#update', as: 'update_configuracion'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end