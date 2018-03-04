require_dependency 'oauth/assemble_access_code_url'

class DashboardController < ApplicationController
  def index
    if !logged_in?
      redirect_to login_path
      return
    end

    @instagram_access_code_url = OAuth::AssembleAccessCodeUrl.call.value
  end
end
