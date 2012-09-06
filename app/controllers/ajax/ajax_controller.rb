class Ajax::AjaxController < ApplicationController
  
  # Do not render by default
  layout false
  
  before_filter :ensure_is_xhr
  around_filter :ajax_exception_wrapper
    
  public
  
  protected
  
  def default_exception_message
    "There was an error processing your request"
  end
  
  def respond_with_json(status, message, payload)
    render json: {status: status, message: message, payload: payload}
  end
    
  private
  
  # Catch-all for the AJAX requests that standardizes the error-return format
  def ajax_exception_wrapper
    begin
      yield
    rescue Exception => e
      logger.error e.backtrace
      msg = Rails.env.production? ?  default_exception_message : e.message
      respond_with_json(400, msg, nil)
    end
  end
  
  def ensure_is_xhr
    # Sub-application wide exclusion for non-ajax requests
    redirect_to root_url unless request.xhr?
  end
  
end