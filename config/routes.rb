Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root   'static_pages#home'
   get    '/help',    to: 'static_pages#help'
   get    '/about',   to: 'static_pages#about'
   get    '/contact', to: 'static_pages#contact'
   get    '/signup',  to: 'users#new'
   get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'

  post '/appointments/new', to: 'appointments#new', as: 'trial'

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]  do
    get "/pets", to: 'users#pets'
    get '/pets/:id/edit', to: 'pets#edit', as: "edit_pet"
    resources :pets, shallow: true, only: [:new, :create, :update, :destroy]
  end

  resources :appointments
  resources :sessions, only: [:new, :create, :destroy]
end

   # post '/reroute', to: 'application#reroute'

# get '/pets/:pet_id/appointments/new', to: 'appointments#new', as: "new_appointment"
# post '/pets/:pet_id/appointments/new', to: 'appointments#create', as: "create_appointment"
# get '/appointments', to: 'appointments#show', as: 'appointment'
# resources :appointments

# get '/pets/new', to: 'pets#new'
# get '/pets/:id', to: 'pets#show', as: 'show_pet'
# get '/pets/:id/edit', to: 'pets#edit', as: 'pet'
# post '/pets', to: 'pets#create'
# patch '/pets/:id/edit', to: 'pets#update', as: 'edit_pet'
# delete '/pets/:id', to: 'pets#destroy'
