PostitTemplate::Application.routes.draw do
  resources :posts, except: :destroy do
    resources :comments, only: :create
  end

  root to: 'posts#index'
end
