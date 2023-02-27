Rails.application.routes.draw do
  get 'signups/create'
  get 'campers/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:index, :show, :create], include: :activities
  resources :signups, only: [:create]
end
