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

  def facebook_redirect
    result = OAuth::RequestAccessToken.call(code: params[:code])
    if result.failed?
      Rails.logger.error("failed to request access token: #{result.failure}")
      return
    end

    response_body = result.value
    store_facebook_token(response_body[:access_token])
    # make cookie expire in: response_body['expires_in']
    redirect_to dashboard_path
  end
end
