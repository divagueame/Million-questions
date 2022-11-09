class Game < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id
  before_destroy :create_report

  def questions_left
    Question.all.count - User.find(user_id).answers.count
  end

  def questions_answered
    1 + User.find(user_id).answers.count
  end

  def create_report
    answers = self.user.answers
    correct = answers.where(correct: true)
    questions = Question.all
    Report.create(answers: answers.count, correct: correct.count, questions: questions.count, user_id: user_id)
  end
end
