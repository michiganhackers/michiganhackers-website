Website::Application.routes.draw do

  ##################
  # Static Routing #
  ##################

  root to: "static_pages#home"
  get "/sponsors" => "static_pages#sponsors", as: :sponsors
  
  # For testing the 404 page
  if Rails.env.development?
    get "/404" => "static_pages#error", as: :error
  end

  ####################
  # Standard Routing #
  ####################

  resources :events, only: [:index]
  resources :resources

  # This way we can internally work with "User" objects, while the API refers to them as members
  get "/members" => "users#index", as: :members
  post "/members" => "users#create", as: :members

  resources :users, path: :members, as: :member, except: [:index, :create]

  ################
  # Ajax Routing #
  ################
  scope "ajax", module: :ajax do
    post "/sign-up" => "users#sign_up_by_email_and_type", as: :ajax_sign_up
  end
  
  #################
  # Admin Routing #
  #################
  scope "admin", module: :admin do
    
  end
  
  
  ##################
  # Error Handling #
  ##################
  
  match "*a", to: "static_pages#error"
  
  
end
