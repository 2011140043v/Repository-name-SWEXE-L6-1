Rails.application.routes.draw do
  resources :users
  resources :tweets
  root 'top#main'
  
  get 'top/main'
  get 'top/login'
  post 'top/login'
  get 'top/logout'
  
  resources :likes
#  get 'like/id', to: 'liks#show'
#  post 'likes', to: 'likes#create'
#  delete 'likes/:id' , to: 'likes#destroy'
end
