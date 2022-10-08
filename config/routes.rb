Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  resources :users, only: %i[index, show] do
    resources :posts, only: %i[index, show]
  end

  get "/", to: "users#index"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/:id", to: "posts#show"
  get "/createpost", to: "posts#loadpost"
  post "/new", to: "posts#create"
  get "/loadcomment/:id" , to: "comments#index"
  post "/new-comment", to: "comments#create"
  post "/like", to: "likes#index"
  post "/deletepost", to: "posts#delete"
  post "/deletecomment", to: "comments#remove"

  # get "/api/posts", to: "posts#listposts"

  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: [:index, :show]
  #   end
  # end

  namespace :api do
    namespace :v1 do
      # post '/login', to: 'authentication#login'

      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:create, :index]
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
