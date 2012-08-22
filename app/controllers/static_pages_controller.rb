class StaticPagesController < ApplicationController

  before_filter :load_upcoming_events, only: [:home]

  def home
    
  end

end
