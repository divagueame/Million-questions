class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validates :user_id, uniqueness: {
    scope: [ :question_id ]
  }

  def correct?
    self.question.correct_answer.casecmp?(self.title)
  end
end
