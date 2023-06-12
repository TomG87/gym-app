Rails.application.routes.draw do
get "/exercises" => "exercises#index"
get "/users" => "users#index"
get "/routines" => "routines#index"
get "/other" => "exercises#other"

post "/users" => "users#create"
post "/sessions" => "sessions#create"
post "/routines" => "routines#create"
end
