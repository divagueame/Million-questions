class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers, dependent: :destroy

  def unanswered_questions
    user_answers = self.answers.pluck(:question_id)
    Question.where.not(id: user_answers)
  end
end