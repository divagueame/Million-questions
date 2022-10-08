require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user_game_ended = users(:one)
    @user_game_going = users(:two)
    @user_no_game = users(:three)
  end

  test "should redirect to game report if user game is ended" do
    sign_in @user_game_ended
    get game_url
    assert_redirected_to game_report_path
  end


  test "should get index if game is going" do
    sign_in @user_game_going 
    get game_url
    assert_response :success
  end

  test "should create game if user no game" do
    sign_in @user_no_game 
    get game_url
    assert_response :success
  end
end
