class Ajax::EventsController < Ajax::AjaxController

  def sign_in
    uniqname = params[:user][:uniqname]
    
    @event = Event.find_by_eid params[:eid]
    @user = User.find_by_email("#{uniqname}@umich.edu") || User.new_from_uniqname!(uniqname)

    unless EventSignIn.find_by_user_id_and_eid(@user.id, @event.id).nil?
      notice_msg = "You've already signed in #{@user.first_name}! Please pass this along to the next attendee."
    else
      EventSignIn.new({user_id: @user.id, eid: @event.id}).save!
      notice_msg = "Thank you for signing in #{@user.first_name}! Please pass this along to the next attendee."
    end
    
    respond_with_json 200, notice_msg, {}
  end

end