PostitTemplate::Application.routes.draw do

  resources :categories

  resources :posts do
    resources :comments
  end

  resources :sessions
  resources :users

  root to: 'posts#index'
end
