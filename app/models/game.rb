class Game < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id

  def questions_left
    Question.all.count - User.find(self.user_id).answers.count
  end


  def questions_answered
    1 + User.find(self.user_id).answers.count
  end
end
