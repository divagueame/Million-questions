class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  before_create :check_if_correct
  validates :title, length: { minimum: 1 }
  validates :user_id, uniqueness: {
    scope: [:question_id]
  }
  after_create :update_game_status

  def correct?
    question.correct_answer.casecmp?(title)
  end

  private

  def check_if_correct
    self.correct = correct?
  end

  def self.top(limit)
    Answer.where(correct: true).group(:user_id).count.sort_by { |_k, v| -v }.slice(0, limit)
  end

  def update_game_status
    return if user.unanswered_questions.any?

    user.game.update(ended: true)
  end
end
