Rails.application.routes.draw do
        # Root path
          root "sessions/sessions#new"
       # Sessions
          get 'login' => 'sessions/sessions#new', as: 'sign_in'
          match 'logout' => 'sessions/sessions#destroy', as: 'sign_out'
        # dashboard
         get '/dashboard' => 'dashboard/dashboard#index', as: 'dashboard'
         # Users
          get '/registrarse' => 'users/users#new', as: 'sign_up'
          post '/registrarse' => 'users/users#create', as: 'sign_up_user'
          get 'user/:id/edit' => 'users/users#edit', as: 'edit_user'
          patch '/user/:id' => 'users/users#update', as: 'update_user'
          patch '/user/:id' => 'users/users#destroy', as: 'destroy_user'
          get 'users/index' => 'users/users#index', as: 'index' 

      
      
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end