PostitTemplate::Application.routes.draw do

  resources :categories

  resources :posts do
    resources :comments
    resources :votes, only: :create
  end

	
  resources :users	

  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"
  delete "/sign_out", to: "sessions#destroy"

  root to: 'posts#index'
end
