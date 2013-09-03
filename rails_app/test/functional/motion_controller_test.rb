require 'test_helper'

class MotionControllerTest < ActionController::TestCase
  test "should get pull" do
    get :pull
    assert_response :success
  end

  test "should get push" do
    get :push
    assert_response :success
  end

end
