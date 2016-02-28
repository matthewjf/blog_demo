Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'

  root               'posts#index'
  get 'about'         => 'static_pages#about'
  get 'contact'       => 'static_pages#contact'
  get 'signup'        => 'users#new'

  get 'login'         => 'sessions#new'
  post 'login'        => 'sessions#create'
  delete 'logout'     => 'sessions#destroy'

  get 'posts/pending'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
  end
  resources :sections
  resources :labels
  resources :static_pages
end
