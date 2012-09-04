class UserDetailsController < ApplicationController
  
  # This action is common to both the new and create actions   
  before_filter only: [:new, :create] do
    @user = User.find_by_confirmation_hash params[:confirmation_hash]
    redirect_to root_path and return if @user.nil? or not @user.user_detail.nil?
  end
      
  def new
  end
  
  def create
    
    # Using the hash for the lookup should be more secure than using an ID
    @user_detail = @user.build_user_detail params[:user_detail]
    
    if @user_detail.save
      redirect_to root_path
    else
      render "new"
    end
  
  end
  
end