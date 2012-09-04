class StaticPagesController < ApplicationController


  def home
    @upcoming_events = Event.upcoming_events.slice(0,2)
  end

  def error

  end

  def sponsors
  end
  
end
