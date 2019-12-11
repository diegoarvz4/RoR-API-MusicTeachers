Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :music_teachers 
  resources :appointments
  resources :musical_instruments
  resources :music_genres
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
