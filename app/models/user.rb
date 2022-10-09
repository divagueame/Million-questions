class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers, dependent: :destroy
  has_one :game, dependent: :destroy

  def unanswered_questions
    user_answers = self.answers.pluck(:question_id)
    Question.where.not(id: user_answers)
  end

  def correct_answers
    self.answers.select{ |answer| answer.correct? }
  end

  def is_playing
    self.game.present? && self.game.is_playing
  end

  def finished_game
    self.game.present? && !self.game.is_playing
  end
end