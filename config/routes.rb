Rails.application.routes.draw do

  get 'sessions/new'

  root                'static_pages#home'
  get    'about'   => 'static_pages#about'
  get    'help'    => 'static_pages#help'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources        :users
  resources        :microposts, only: [:create, :destroy]
  resources        :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
