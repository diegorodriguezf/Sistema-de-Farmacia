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
          delete '/user/:id' => 'users/users#destroy', as: 'destroy_user'
          get 'users/index' => 'users/users#index', as: 'index' 
          if Rails.env.production?
            get '404', to: 'application#page_not_found'
            get '422', to: 'application#server_error'
            get '500', to: 'application#server_error'
          end
      
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end