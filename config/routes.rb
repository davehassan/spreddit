RedditClone::Application.routes.draw do

  resources :users, only: [:new, :create, :show, :edit, :update]
  resource  :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create]
end
