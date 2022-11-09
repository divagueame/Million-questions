require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "Destroying a game creates the corresponding report" do
    assert_difference("Report.count") do
      Game.last.destroy
    end
  end
end
