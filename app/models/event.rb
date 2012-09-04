require "active_facebook/active_facebook"

class Event < ActiveFacebook::Base
  
  FIELDS = [:id, :start_time, :end_time, :description, :location, :name].join(",")
  DEFAULT_PARAMS = {fields: FIELDS}
  
  def self.find_by_eid(eid)
    get_event(eid)
  end
  
  # Class Methods
  def self.upcoming_events
    get_events({since: Time.now.to_i})
  end
  
  def self.past_events    
    get_events({until: Time.now.to_i})  
  end

  # Instance Methods
  def initialize(raw_hash)
    @raw_hash = raw_hash
  end

  def <=>(other)
    start_time.to_i - other.start_time.to_i
  end

  def start_time
    Time.parse @raw_hash["start_time"]
  end
  
  def end_time
    Time.parse @raw_hash["end_time"] unless @raw_hash["end_time"].nil?
  end

  def attending
    get_attending
  end

  # This is a hack - should work for now
  def method_missing(m, *args, &block)
    @raw_hash[m.to_s]
  end
    
  private
  
  def self.get_event(eid, params={})
    Event.new graph_instance.get_object(eid, DEFAULT_PARAMS.merge(params||{}))
  end
  
  def self.get_events(params={})
    events = graph_instance.get_connections("michiganhackers", "events", DEFAULT_PARAMS.merge(params||{})).map { |e| Event.new e }
    events.sort
  end  
  
  def get_attending
    (self.class.send :graph_instance).get_connection(@raw_hash["id"], "attending")
  end  
    
end