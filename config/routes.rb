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
  get "/users/:id/posts/:post_id", to: "posts#show"
  get "/createpost", to: "posts#loadpost"
  post "/new", to: "posts#create"
  get "/users/:user_id/posts/:post_id/loadcomment" , to: "comments#index"
  post "/users/:user_id/posts/:post_id/new-comment", to: "comments#create"
  post "/like", to: "likes#index"
  post "/deletepost", to: "posts#delete"
  post "/deletecomment", to: "comments#remove"

  get "api/v1/users/:user_id/posts", to: "api/v1/posts#index"
  get "api/v1/users/:user_id/posts/:post_id/comments", to: "api/v1/comments#index"
  post "api/v1/users/:user_id/posts/:post_id/comment", to: "api/v1/comments#create" 
  get "/api/v1/users/:user_id/posts/:post_id/comments/new", to: "api/v1/comments#new"
  post "api/v1/users/new-comments", to: "api/v1/comments#create"
  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: [:index] do
  #         resources :posts, only: [:index], format: :json do
  #           resources :comments, only: %i[index new create], format: :json
  #          resources :likes, only: [:create]
  #        end
  #     end
  #   end
  # end
end
