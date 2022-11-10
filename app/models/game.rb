class Game < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id
  before_destroy :create_report
  before_destroy :destroy_answers
  after_destroy do
    create_new_game(self.user_id)
  end

  def questions_left
    Question.all.count - User.find(user_id).answers.count
  end

  def questions_answered
    1 + User.find(user_id).answers.count
  end

  def create_report
    answers = user.answers
    correct = answers.where(correct: true)
    questions = Question.all
    Report.create(answers: answers.count, correct: correct.count, questions: questions.count, user_id: user_id)
  end

  def destroy_answers
    user.answers.destroy_all
  end

  def create_new_game(user_id)
    Game.create(user_id: user_id)
  end
end
