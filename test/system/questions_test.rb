require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    # @question = questions(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit questions_url
    assert_selector "h1", text: "Questions"
    assert_selector ".question", count: 3
  end

  # test "should create question" do
  #   visit questions_url
  #   click_on "New question"

  #   fill_in "Correct answer", with: @question.correct_answer
  #   fill_in "Description", with: @question.description
  #   fill_in "Title", with: @question.title
  #   click_on "Create Question"

  #   assert_text "Question was successfully created"
  #   click_on "Back"
  # end

  # test "should update Question" do
  #   visit question_url(@question)
  #   click_on "Edit this question", match: :first

  #   fill_in "Correct answer", with: @question.correct_answer
  #   fill_in "Description", with: @question.description
  #   fill_in "Title", with: @question.title
  #   click_on "Update Question"

  #   assert_text "Question was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Question" do
  #   visit question_url(@question)
  #   click_on "Destroy this question", match: :first

  #   assert_text "Question was successfully destroyed"
  # end
end
