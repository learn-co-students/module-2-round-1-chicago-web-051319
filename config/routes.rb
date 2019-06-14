Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, except: [:destroy, :edit, :update ]

  get '/search', to: 'heroines#search', as: 'search'
end
