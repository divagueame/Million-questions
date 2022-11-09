class Report < ApplicationRecord
  belongs_to :user

  validates_presence_of :percentage
  before_validation :add_percentage

  scope :highest, -> { order(percentage: :desc) }

  def self.top_by_user(limit)
    where('answers >= ?', 6)
      .group(:user_id)
      .maximum(:percentage)
      .sort_by(&:last)
      .reverse
      .first(limit)
      .to_h
  end

  def self.top_by_user_2(_limit)
    where('answers >= ?', 6)
    .select('MAX(percentage) AS percentage', 'user_id')
    .group(:user_id)
  end

  def is_top_10?
    self.percentage > self.class.highest.first(10).last.percentage
  end

  private

  def add_percentage
    percentage = (100 * correct) / questions
    percentage = percentage.to_f.round(2)
    self.percentage = percentage
  end
end
