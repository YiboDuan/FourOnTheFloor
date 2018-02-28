require 'test_helper'
require_dependency 'controller/sessions_controller'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

end
