class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :request_exception_wrapper

  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from AbstractController::ActionNotFound, with: :render_404

  public

  protected
  
    # Handler for redirecting to the 404 page
    def render_404(error)
      @error_message = error
      render template: "static_pages/error"
    end
  
    # Define this as a class method so that children can use it
    def load_upcoming_events
      @upcoming_events = Event.upcoming_events
    end
  
  private
  
    def request_exception_wrapper
      begin
          yield
      rescue Exception => e
        render_404(e)
      end
    end
  
end
