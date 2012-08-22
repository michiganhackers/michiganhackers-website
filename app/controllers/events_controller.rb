class EventsController < ApplicationController
  
  def index
    @events = Event.limit(5).to_a
  end
  
end