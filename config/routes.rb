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
  
  # CSEducation Week Routing
  get "/cseducation/submit" => "static_pages#cseducation_submit", as: :cs_edu_submit
  get "/cseducation/leaderboard" => "static_pages#cseducation_leaderboard", as: :cs_edu_leaderboard
  get "/cseducation/countdown" => "static_pages#cseducation_countdown", as: :cs_edu_countdown
  post "/cseducation/submit" => "static_pages#cseducation_process", as: :cs_edu_process

  # Needs to go after the static routing
  get "/cseducation/(:qid)" => "static_pages#cseducation", as: :cs_edu
  



  # Resources
  # TODO - Rename or repurpose this
  resources :resources

  # Users
  get "/members/activate/:confirmation_hash" => "users#activate_user", as: :activate_user
  resources :users, path: :members, except: [:create, :new]

  # No-Auth User Details
  get "/members/:confirmation_hash/details/new" => "user_details#new", as: :new_user_detail
  post "/members/:confirmation_hash/details/new" => "user_details#create", as: :create_user_detail

  # Authentication
  # Login and Logout
  get "/login" => "users#login", as: :login
  post "/login" => "users#authenticate", as: :authenticate_user
  get "/logout" => "users#deauthenticate", as: :logout

  ################
  # Ajax Routing #
  ################
  scope "ajax", module: :ajax do
    post "/sign-up" => "users#sign_up_by_email_and_type", as: :ajax_sign_up
    post "/events/:eid/signin" => "events#sign_in", as: :ajax_event_sign_in
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
