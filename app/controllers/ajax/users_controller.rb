class Ajax::UsersController < Ajax::AjaxController
  
  ###########################################
  # Methods for all user account management #
  ###########################################
  filter_access_to [:sign_up_by_email_and_type], require: :authorize  
  
  def sign_up_by_email_and_type
        
    user = User.new params[:user]
    
    user.user_type = UserType.find_by_type_name params[:user_type][:type_name]
    user.set_fullname_from_ldap if user.is_student?
    
    user.save!
        
    response_text = user.first_name.empty? ? "Thank you for registering!" : "Thank you for registering, #{user.first_name}!"
    respond_with_json 200, response_text, {}
  end
  
end