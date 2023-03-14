Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "search", to: "pages#search"
  get "search_api", to: "pages#search_api"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :list_movies, only: [:create]
    resources :list_books, only: [:create]
    resources :list_podcasts, only: [:create]
  end

  resources :list_movies, only: [:destroy]
  resources :list_books, only: [:destroy]
  resources :list_podcasts, only: [:destroy]


  resources :movies, except: [:destroy, :edit, :update] do
    resources :movie_reviews, only: [:create]
  end


  resources :movie_reviews, only: [:destroy]

  resources :books, except: [:destroy, :edit, :update] do
    resources :book_reviews, only: [:create]
  end

  resources :book_reviews, only: [:destroy]


  resources :podcasts, except: [:destroy, :edit, :update] do
    resources :podcast_reviews, only: [:create]
  end

  resources :podcast_reviews, only: [:destroy]

  resources :users, only: [:show] do
    member do
      post :follow
      post :unfollow
      get :followers
      get :following
    end
  end

end
