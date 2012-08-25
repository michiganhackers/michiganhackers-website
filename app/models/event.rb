class Event < ActiveRecord::Base
  
  scope :upcoming_events, lambda { where("start_time > ?", Time.now) }
  scope :past_events, lambda { where("start_time < ?", Time.now) }
    
end