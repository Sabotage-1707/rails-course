Rails.application.routes.draw do
  devise_for :users

resources :items do
  get "upvote" , on: :member
  get "expensive", on: :collection
end

root to: "items#index"
get "/admin", to: "admin#users_count"

end
