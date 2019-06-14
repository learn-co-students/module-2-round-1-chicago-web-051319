Rails.application.routes.draw do
  resources :powers, except: [:destroy]
  resources :heroines, except: [:destroy]
end
