Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :music_teachers, only: :index
  resources :appointments, except: %i[show update edit]
  resources :musical_instruments, only: :index
  resources :music_genres, only: :index
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
