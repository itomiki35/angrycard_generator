Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  get 'guest_login', to: 'user_sessions#guest_login'

  get 'sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps/sitemap.xml.gz")

  resources :users, only: %i[new create]
  resources :angry_cards, only: %i[new create index show destroy]
  resources :my_pages, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

end
