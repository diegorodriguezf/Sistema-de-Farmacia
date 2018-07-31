Rails.application.routes.draw do
     # Root path
     devise_scope :user do
        root "users/sessions#new"
       # Sessions
        get '/login' => 'users/sessions#new', as: 'sign_in'
        post '/login' => 'users/sessions#create', as: 'sign_in_user'
        delete '/logout' => 'users/sessions#destroy', as: 'sign_out'
        # dashboard
         get '/dashboard' => 'dashboard/dashboard#index', as: 'dashboard'
        # Registrations
        get '/registrarse' => 'users/registrations#new', as: 'sign_up'
        post '/registrarse' => 'users/registrations#create', as: 'sign_up_user'
        get 'user/:id/edit' => 'users/registrations#edit', as: 'edit_user'
        patch '/user/:id' => 'users/registrations#update', as: 'update_user'
        patch '/user/:id' => 'users/registrations#destroy', as: 'destroy_user'
        get 'users/index' => 'users/registrations#index', as: 'index' 
       # Passwords
        get '/reestablecer_contrasena' => 'users/passwords#new', as: 'recovery_password'
        get '/editar_contrasena/:reset_password_token' => 'users/passwords#edit', as: 'edit_password'
        post '/reestablecer_contrasena' => 'users/passwords#create', as: 'recovery_password_user'
        patch '/editar_contrasena' => 'users/passwords#update', as: 'update_password'
        # Confirmations
        get '/confirmar_cuenta' => 'users/confirmations#new', as: 'confirm_account'
        get '/confirmacion/:confirmation_token' => 'users/confirmations#show', as: 'confirmation'
        post '/confirmar_cuenta' => 'users/confirmations#create'
        # Unlocks
        get '/desbloquear_cuenta' => 'users/unlocks#new', as: 'unlock_account'
        get '/desbloquear/:unlock_token' => 'users/unlocks#show', as: 'unlock'
        post '/desbloquear_cuenta' => 'users/unlocks#create', as: 'unlock_account_user'
        # Profiles
        get '/cuenta/:id' => 'users/profiles#show', as: 'account'
        get '/editar_cuenta' => 'users/profiles#edit', as: 'edit_account'
        patch '/editar_cuenta' => 'users/profiles#update', as: 'update_account'
        patch '/desactivar_cuenta' => 'users/profiles#destroy', as: 'deactive_account'
     end 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end