class StaticPagesController < ApplicationController

  before_filter :load_upcoming_events, only: [:home]

  def home
    
  end

  def error

  end

  def sponsors
  end
  
end
