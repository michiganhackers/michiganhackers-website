class Ajax::AjaxController < ApplicationController
  
  # Do not render by default
  layout false
  
  before_filter :ensure_is_xhr
  around_filter :ajax_exception_wrapper
    
  public
  
  protected
  
  def respond_with_json(status, message, payload)
    render json: {status: status, message: message, payload: payload}
  end
    
  private
  
  # Catch-all for the AJAX requests that standardizes the error-return format
  def ajax_exception_wrapper
    begin
      yield
    rescue Exception => e
      respond_with_json(400, e.message, e)
    end
  end
  
  def ensure_is_xhr
    # Sub-application wide exclusion for non-ajax requests
    redirect_to root_url unless request.xhr?
  end
  
end