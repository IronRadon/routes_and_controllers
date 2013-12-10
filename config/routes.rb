RoutesControllersApp::Application.routes.draw do

  # resources :users

  get   "users(.:format)", :to => "users#index"
  post  "users(.:format)", :to => "users#create"
  get   "users/new(.:format)", :to => "users#new"
  get   "users/:id/edit(.:format)", :to => "users#edit"
  get   "users/:id(.:format)", :to => "users#show"
  put   "users/:id(.:format)", :to => "users#update"
  delete "users/:id(.:format)", :to => "users#destroy"



end
