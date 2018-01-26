Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root   'static_pages#home'
   get    '/help',    to: 'static_pages#help'
   get    '/about',   to: 'static_pages#about'
   get    '/analytics', to: 'static_pages#analytics'
   get    '/signup',  to: 'users#new'
   get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'

  post '/appointments/new', to: 'appointments#new'
  resources :pets, only: [:show, :index]
  resources :appointments
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]  do
    get "/pets", to: 'users#pets'
    get '/pets/:id/edit', to: 'pets#edit', as: "edit_pet"
    get '/pets/appointments', to: 'pets#appointments', as: "pets_appointments"
    resources :pets, shallow: true, only: [:new, :create, :edit, :update, :destroy]
  end
end
