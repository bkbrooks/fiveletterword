Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games, except: [:delete, :update]

  post 'games/:game_id/make_guess', to: 'guesses#make_guess'
end
