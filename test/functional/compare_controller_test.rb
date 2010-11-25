require 'test_helper'

class CompareControllerTest < ActionController::TestCase
  test "should get compare" do
    get :compare
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

end
