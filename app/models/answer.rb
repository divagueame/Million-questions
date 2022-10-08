class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  before_create :check_if_correct
  validates :title, length: { minimum: 1 }
  validates :user_id, uniqueness: {
    scope: [ :question_id ]
  }

  def correct?
    self.question.correct_answer.casecmp?(self.title)
  end

  private

  def check_if_correct
    self.correct = self.correct?
  end
  
  def self.top(limit)
    Answer.where(correct:true).group(:user_id).count.sort_by {|k,v| -v }.slice(0,limit)
  end
end
