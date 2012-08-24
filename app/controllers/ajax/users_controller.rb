class Ajax::UsersController < Ajax::AjaxController
    
  def sign_up_by_email_and_type
    
    @user = User.new_user_by_type params[:user_type], params[:user]
    @user.save!
    
  end
  
end