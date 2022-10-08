require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user_one = users(:one)
    sign_in @user_one
  end


  test "should get index" do
    get game_url
    assert_response :success
  end
end
