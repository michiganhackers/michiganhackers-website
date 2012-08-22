class ApplicationController < ActionController::Base
  protect_from_forgery

  public

  protected
  
  # Define this as a class method so that children can use it
  def load_upcoming_events
    @upcoming_events = Event.upcoming_events
  end
  
  private
  
end
