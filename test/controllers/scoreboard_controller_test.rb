require "test_helper"

class ScoreboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scoreboard_index_url
    assert_response :success
  end
end
