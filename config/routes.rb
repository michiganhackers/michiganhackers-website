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

  # Events
  get "/events/signin/:eid" => "events#show_sign_in", as: :show_event_sign_in
  post "/events/signin/:eid" => "events#record_sign_in", as: :record_event_sign_in
  resources :events, only: [:index]
  

  # Resources
  resources :resources

  # Users
  get "/members/activate/:confirmation_hash" => "users#activate_user", as: :activate_user
  #post "/members/new" => "users#create", as: :create_user
  resources :users, path: :members, except: [:create, :new]

  # User Details
  get "/members/:confirmation_hash/details/new" => "user_details#new", as: :new_user_detail
  post "/members/:confirmation_hash/details/new" => "user_details#create", as: :create_user_detail

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

  ################
  # Wiki Routing #
  ################
  # wiki_root '/wiki'
  
  ##################
  # Error Handling #
  ##################
  
  match "*a", to: "static_pages#error"
  
  
end
