class Report < ApplicationRecord
  belongs_to :game
  belongs_to :user

  after_initialize :add_user
  before_validation :add_percentage


  def self.top(limit)
    Report.where('questions > ?', Question.all.count - 10).order(percentage: :desc).limit(limit)
  end

  private

  def add_user
    self.user_id = self.game&.user_id
  end

  def add_percentage
    percentage = (100 * self.correct) / self.questions
    percentage = percentage.to_f.round(2)
    self.percentage = percentage
  end


end
