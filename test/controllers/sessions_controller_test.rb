require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
