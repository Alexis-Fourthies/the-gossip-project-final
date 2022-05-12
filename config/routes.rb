Rails.application.routes.draw do
  resources :gossips
  resources :users
  resources :cities
  resources :gossips do
    resources :comments, only: [:new, :create, :index, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :likes, only: [:create, :destroy]

  get '/', to: 'gossips#index'
  get '/team', to: 'team#our_team'
  get '/contact', to: 'contact#contact_form'
  post 'gossips/:id/comments', to: 'comments#create', as: 'gossips_create_comment'


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
