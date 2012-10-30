module SessionHelper
  def current_user=(user)
    session[:_active_user_id] = user.id
    @_active_user = user
  end

  def current_user
    unless session[:_active_user_id].nil?
      @_active_user ||= User.find(session[:_active_user_id])
    end
  end

  def clear_current_user
    session[:_active_user_id] = nil
    @_active_user = nil
  end
end