class Ajax::UsersController < Ajax::AjaxController
    
  def sign_up_by_email_and_type
        
    User.new_user_by_type(params[:user_type], params[:user]).save!
    respond_with_json 200, "Thank you for registering!", {}
  
  end
  
end