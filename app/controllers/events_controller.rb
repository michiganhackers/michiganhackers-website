class EventsController < ApplicationController
  
  def index
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  def show_sign_in
    @event = Event.find_by_eid params[:eid]
  end
  
  def record_sign_in
    uniqname = params[:user][:uniqname]
    
    @event = Event.find_by_eid params[:eid]
    @user = User.find_by_email("#{uniqname}@umich.edu") || User.new_from_uniqname!(uniqname)

    unless EventSignIn.find_by_user_id_and_eid(@user.id, @event.id).nil?
      notice_msg = "You've already signed in #{@user.first_name}! Please pass this along to the next attendee."
    else
      EventSignIn.new({user_id: @user.id, eid: @event.id}).save!
      notice_msg = "Thank you for signing in #{@user.first_name}! Please pass this along to the next attendee."
    end
    
    redirect_to show_event_sign_in_path(@event.id), notice: notice_msg
  end
  
end