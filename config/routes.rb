Rails.application.routes.draw do


  root "posts#index"


  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"                    #なぜ"post"では反応しなくて、"get"で反応する？？
  post "logout" => "users#logout"


  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "users/:id/like" => "users#like"
  get "users/:id/message_box" => "users#message_box"
  get "users/:id" => "users#show"



  get "posts/index" => "posts#index"
  get "posts/new" => "posts/new"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  get "posts/:id/destroy" => "posts#destroy"        #なぜ"post"では反応しなくて、"get"で反応する？？
  get "posts/daily_item" => "posts#daily_item"
  get "posts/vehicle" => "posts#vehicle"
  get "posts/apartment" => "posts#apartment"
  get "posts/job" => "posts#job"
  get "posts/service" => "posts#service"
  get "posts/community" => "posts#community"
  get "posts/:id" => "posts#show"



  get "likes/:post_id/create" => "likes#create"     #なぜ"post"では反応しなくて、"get"で反応する？？
  get "likes/:post_id/destroy" => "likes#destroy"   #なぜ"post"では反応しなくて、"get"で反応する？？



  post "rooms/create" => "rooms#create"
  get "rooms/:id" => "rooms#show"


  post "messages/create" => "messages#create"


  get "contacts/new" => "contacts#new"
  post "contacts/create" => "contacts#create"


end
