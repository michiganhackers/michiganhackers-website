class StaticPagesController < ApplicationController


  def home
    @upcoming_events = Event.upcoming_events.limit(2)
  end

  def error

  end

  def sponsors
  end
  
end
