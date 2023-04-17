Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  get 'guest_login', to: 'user_sessions#guest_login'


  resources :users, only: %i[new create]
  resources :angry_cards, only: %i[new create index show destroy]
  resources :my_pages, only: %i[show edit update]

end
