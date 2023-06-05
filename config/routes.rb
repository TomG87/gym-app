Rails.application.routes.draw do
get "/exercises" => "exercises#index"
get "/users" => "users#index"
get "/routines" => "routines#index"

end
