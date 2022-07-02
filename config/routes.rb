Rails.application.routes.draw do
  resources :sub_comments
  resources :comments
  resources :posts
  get '/get-posts/:page' => 'posts#getPostsPaginated'
  get '/get-single-posts/:id' => 'posts#getPostsAndComments'
  get '/posts/comments/:postId/:limit' => 'comments#getPostsComments'
  get '/comments/sub-comments/:commentId/:limit' => 'sub_comments#getCommentsSubComments'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
