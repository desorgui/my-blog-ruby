Rails.application.routes.draw do
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

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
