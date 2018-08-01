Rails.application.routes.draw do
  resources :games, except: [:delete, :update]

  post 'games/:game_id/make_guess', to: 'guesses#make_guess'
end
