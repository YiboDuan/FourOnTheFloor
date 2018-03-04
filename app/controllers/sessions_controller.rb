require_dependency 'oauth/request_access_token'

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  def instagram_redirect
    result = OAuth::RequestAccessToken.call(code: params[:code])
    if result.failed?
      # handle failure!
      return
    end

    response_body = JSON.parse(result.value.body)
    store_instagram_token(response_body['access_token'])

    redirect_to dashboard_path
  end
end
