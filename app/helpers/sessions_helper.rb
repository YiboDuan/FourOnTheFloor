module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def instagram_authorized?
    !!session[:instagram_access_token]
  end

  def store_instagram_token(token)
    session[:instagram_access_token] = token
  end
end
