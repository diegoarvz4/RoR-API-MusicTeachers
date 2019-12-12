Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :music_teachers 
  resources :appointments
  resources :musical_instruments
  resources :music_genres
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post '/music_teachers/:id/add_music_genre', to: 'music_teachers#add_music_genre'
  post '/music_teachers/:id/add_musical_instrument', to: 'music_teachers#add_musical_instrument'
end
