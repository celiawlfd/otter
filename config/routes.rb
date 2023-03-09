Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :list_movies, only: [:create]
  end
  resources :list_movies, only: [:destroy]

  resources :movies, except: [:destroy, :edit, :update] do
    resources :movie_reviews, except: [:index, :show, :new]
  end
  resources :books

  resources :movies_reviews, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
