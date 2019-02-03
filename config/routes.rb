Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
