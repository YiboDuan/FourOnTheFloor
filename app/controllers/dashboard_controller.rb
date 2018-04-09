require_dependency 'oauth/build_facebook_login_url'
require_dependency 'actions/influencer/get_collection'

class DashboardController < ApplicationController
  def index
    if !logged_in?
      redirect_to login_path
      return
    end

    if facebook_authorized?
      @influencers = ::Actions::Influencer::GetCollection.call!
    else
      state_param = SecureRandom.uuid
      session[:state_nonce] = state_param
      @facebook_access_code_url = OAuth::BuildFacebookLoginUrl.call!(state_param: state_param)
    end
  end
end
