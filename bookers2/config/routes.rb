Rails.application.routes.draw do

  # get 'users/edit'

  root to:'homes#top'
  get '/home/about' => 'users#about'

  devise_for :users
  resources :users, only:[:edit,:update]

  # ユーザー一覧
  get 'users' => 'users#userindex'
  #1ユーザーの投稿一覧
  get 'users/:id' => 'users#usershow', as: 'usershow'

  resources :books, only:[:create,:update,:destroy]

  # 投稿一覧
  get 'books' => 'users#bookindex', as: 'bookindex'

  # 現在のユーザーの投稿詳細
  get 'books/:id' => 'books#show', as: 'bookshow'
  post 'books/:id/favorites/' => 'favorites#create'
  delete 'books/:id/favorites/' => 'favorites#destroy', as: 'book_favorites'
  post 'books/:book_id/post_comments' => 'book_comments#create', as: 'book_book_comments'
  delete 'books/:book_id/post_comments/:id' => 'book_comments#destroy', as: 'book_book_comment'

  get 'books/:id/edit' => 'books#edit'
  post 'books/:id/edit' => 'books#edit', as: 'edit_book'







end
