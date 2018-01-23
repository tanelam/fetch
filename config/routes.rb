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

   # get 'user/:id/pets/new' to 'pets#new'
   #user/pet
   get '/pets', to: 'pets#index', as: 'pets'

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    get "/pets", to: 'users#pets'
    resources :pets
    # get '/pets/new', to: 'pets#new'
    # get '/pets/:id', to: 'pets#show', as: 'show_pet'
    # get '/pets/:id/edit', to: 'pets#edit', as: 'pet'
    # post '/pets', to: 'pets#create'
    # patch '/pets/:id/edit', to: 'pets#update', as: 'edit_pet'
    # delete '/pets/:id', to: 'pets#destroy'
  end

  resources :sessions, only: [:new, :create, :destroy]

end
