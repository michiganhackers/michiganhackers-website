class UsersController < ApplicationController

  ###########################################
  # Methods for all user account management #
  ###########################################
  filter_access_to [:index], require: :manage_account

	# A single member's home page
	def index
	end

  #########################################################
  # Ensure only guests can log in, or activate an account #
  #########################################################
  filter_access_to [:login, :activate_user, :authenticate], require: :login

  # Stub method
  def login
  end

  # Process a user confirmation via email
  def activate_user
    user = User.find_by_confirmation_hash params[:confirmation_hash]
    redirect_to root_path and return if user.nil?
    
    # Activate the user, update the hash, and save
    user.is_active = true
    user.generate_confirmation_hash
    user.save!
    
    # Log in the user
    self.current_user = user
    
    # Create a new user detail if the user has not does this
    redirect_to new_user_detail_path(user.confirmation_hash) and return if user.user_detail.nil?

    # Return to root if we make it this far
    redirect_to root_path
  end
  
  def authenticate
    begin
      # Two potential exception cases
      user = User.find_by_email params[:user][:email]
      raise Exception.new "Invalid password given" unless user.password == params[:user][:password].to_s      
      
      # NOTE - Must use self.active_user to hit the a_u=(val) overloading. Otherwise it creates an instance var.
      self.current_user = user
      redirect_to users_path
    rescue Exception => e
      @error_notice = "Invalid email or password. Please try again."
      render "users/login"
    end
  end
  
  ########################################
  # Ensure only auth'd users can log out #
  ########################################
  filter_access_to [:deauthenticate], require: :logout
  
  # Handles all log out state changes
  def deauthenticate
    self.clear_current_user
    redirect_to :root
  end
  
end
