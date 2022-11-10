class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers, dependent: :destroy
  has_one :game, dependent: :destroy
  has_many :reports, dependent: :destroy
  after_create :create_game

  def unanswered_questions
    user_answers = answers.pluck(:question_id)
    Question.where.not(id: user_answers)
  end

  def correct_answers
    answers.select{ |answer| answer.correct? }
  end

  def max_score
    reports.order(percentage: :desc).first
  end

  def create_game
    Game.create(user_id: id)
  end
end