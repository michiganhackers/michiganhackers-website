class Event < ActiveRecord::Base
  
  def self.upcoming_events(count=5)
    Event.limit(count).order("start_time ASC")
  end
  
end