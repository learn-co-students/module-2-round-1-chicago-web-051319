Rails.application.routes.draw do
  resources :powers, only: [:index, :show, :new, :create, :edit, :update]
  resources :heroines, only: [:index, :show, :new, :create, :edit, :update]
end

# only: [:index, :show, :new, :create, :edit, :update]
# , only: [:index, :show, :new, :create, :edit, :update]  