require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:three)
    @user_one = users(:one)
    sign_in @user_one
  end

  test "should get new" do
    get new_question_answer_url(@question)
    assert_response :success
  end

  test "should create answer" do
    assert_difference("Answer.count") do
      post question_answers_url(@question), params: { answer: { title: 'This is a wrong answer' } }
    end

    assert_redirected_to questions_url
  end


  test "should not create answer if empty" do
    assert_no_difference("Answer.count") do
      post question_answers_url(@question), params: { answer: { title: '' } }
    end

    assert_response :unprocessable_entity
  end

  # test "should show answer" do
  #   get answer_url(@answer)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_answer_url(@answer)
  #   assert_response :success
  # end

  # test "should update answer" do
  #   patch answer_url(@answer), params: { answer: { question_id: @answer.question_id, title: @answer.title, user_id: @answer.user_id } }
  #   assert_redirected_to answer_url(@answer)
  # end

  # test "should destroy answer" do
  #   assert_difference("Answer.count", -1) do
  #     delete answer_url(@answer)
  #   end

  #   assert_redirected_to answers_url
  # end
end
