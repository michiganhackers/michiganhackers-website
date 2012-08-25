class EventsController < ApplicationController
  
  def index
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end
  
end