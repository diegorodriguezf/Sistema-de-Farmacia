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

          #tipo uso
          get '/grupo_medicamento/new' => 'timbrados/timbrados#new', as: 'grupoMedicamento_new'
          post '/grupo_medicamento' => 'grupomedicamentos/grupomedicamentos#create', as: 'grupoMedicamento_create'
          get 'grupo_medicamento/:id/edit' => 'grupomedicamentos/grupomedicamentos#edit', as: 'edit_grupoMedicamento'
          put '/grupo_medicamento/:id' => 'grupomedicamentos/grupomedicamentos#update', as: 'update_grupoMedicamento'
          get 'grupo_medicamento/:id/show' => 'grupomedicamentos/grupomedicamentos#show', as: 'timbrado_grupoMedicamento'
          delete '/grupo_medicamento/:id' => 'grupomedicamentos/grupomedicamentos#destroy', as: 'destroy_grupoMedicamento'
          get 'grupo_medicamento/index' => 'grupomedicamentos/grupomedicamentos#index', as: 'grupoMedicamento_index'
          # medicamento
          get '/medicamento/new' => 'medicamentos/medicamentos#new', as: 'medicamento_new'
          post '/medicamento' => 'medicamentos/medicamentos#create', as: 'medicamento_create'
          get 'medicamento/:id/edit' => 'medicamentos/medicamentos#edit', as: 'edit_medicamento'
          put '/medicamento/:id' => 'medicamentos/medicamentos#update', as: 'update_medicamento'
          get 'medicamento/:id/show' => 'medicamentos/medicamentos#show', as: 'medicamento_show'
          delete '/medicamento/:id' => 'medicamentos/medicamentos#destroy', as: 'destroy_medicamento'
          get 'medicamentos/index' => 'medicamentos/medicamentos#index', as: 'medicamento_index'
          namespace :medicamentos do
            resources :medicamentos do
                 get 'autocomplete_tipoUso_tipo_uso', :on => :collection
            end
          end
          # Configuracion
          get 'configuracion/:id/edit' => 'configuraciones/configuraciones#edit', as: 'edit_configuracion'
          put '/configuracion/:id' => 'configuraciones/configuraciones#update', as: 'update_configuracion'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
