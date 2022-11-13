require "test_helper"

class ReportTest < ActiveSupport::TestCase
  test "gets the right position of a report" do
    report = Report.create(
      answers: 8,
      correct: 8,
      questions: 8,
      user_id: User.last.id
    )

    assert report.valid?
    assert_equal report.percentile, 91.66
    
  end
end
