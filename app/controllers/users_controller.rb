class UsersController < ApplicationController

	# Main members action
	def index
	end

  # Serves the HTML via GET for creating a new user
  def new
  end
  
  # Receives the GET request for creating a new user
  def create
    @user = User.new email: "#{params[:user][:uniqname]}@umich.edu"
    
    @user.user_type = UserType.find_by_type_name "student"
    @user.set_fullname_from_ldap
    
    if @user.save
      render "create"
    else
      render "new"
    end    
  end
  
  # Process a user confirmation via email
  def activate_user
    @user = User.find_by_confirmation_hash params[:confirmation_hash]
    redirect_to root_path and return if @user.nil?
    
    # Activate the user, update the hash, and save
    @user.is_active = true
    @user.generate_confirmation_hash!
    
    # Create a new user detail if the user has not does this
    redirect_to new_user_detail_path(@user.confirmation_hash) and return if @user.user_detail.nil?

    # Return to root if we make it this far
    redirect_to root_path
  end
  
end
