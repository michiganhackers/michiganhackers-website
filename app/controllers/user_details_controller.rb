class UserDetailsController < ApplicationController
      
  def new
    # Use find_by_user_id so as not to throw on "record not found"
    @user = User.find_by_user_id params[:user_id]
    redirect_to root_path if @user.nil? or not @user.user_detail.nil?
    
  end
  
  def create
    
  end
  
end