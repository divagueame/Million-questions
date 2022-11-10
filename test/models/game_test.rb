require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "Destroying a game creates the corresponding report and delete all user answers" do
    user_answers_before = Game.last.user.answers.count
    assert_difference("Report.count") do
      assert_difference("Answer.count", -(user_answers_before)) do
        Game.last.destroy
      end
    end
  end
end
