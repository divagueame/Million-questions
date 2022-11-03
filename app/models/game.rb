class Game < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id
  has_one :report, dependent: :nullify

  def questions_left
    Question.all.count - User.find(self.user_id).answers.count
  end

  def questions_answered
    1 + User.find(self.user_id).answers.count
  end

  def create_report
    answers = self.user.answers
    correct = answers.where(correct: true)
    questions = Question.all
    self.build_report(answers: answers.count, correct: correct.count, questions: questions.count).save
  end
end
