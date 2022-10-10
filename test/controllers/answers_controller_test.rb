require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:three)
    @user_one = users(:one)
    @user_two = users(:two)

  end

  test "should get new" do
    sign_in @user_one
    get new_question_answer_url(@question)
    assert_response :success
  end

  test "should create answer if user has any left" do
    sign_in @user_two
    assert_difference("Answer.count") do
      post question_answers_url(@question, format: :turbo_stream), params: { answer: { title: 'This is a wrong answer' } }
    end

    assert_response :success
  end


  test "should not create answer if empty" do
    sign_in @user_two
    assert_no_difference("Answer.count") do
      post question_answers_url(@question), params: { answer: { title: '' } }
    end

    assert_response :unprocessable_entity
  end

  # test "should show answer" do
  #   sign_in @user_one
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
