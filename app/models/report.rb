class Report < ApplicationRecord
  belongs_to :user

  validates_presence_of :percentage
  before_validation :add_percentage

  after_create :add_percentile
  
  scope :highest, -> { order(percentage: :desc) }
  scope :from_this_month, lambda {
                            where('reports.created_at > ? AND reports.created_at < ?', Time.now.beginning_of_month, Time.now.end_of_month)
                          }

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
    percentage > self.class.highest.first(10).last.percentage
  end

  def self.listable_reports
    Report.from_this_month
    .where('answers >= ?', (Question.count - 2))
    .order(percentage: :desc, answers: :desc)
    .all
  end

  def scoreboard_position
    Report.listable_reports.find_index { |report| report.id == id }
  end

  def add_percentile
    position = 1 + scoreboard_position
    total = Report.listable_reports.count
    percentile = 100 - (position / total.to_f) * 100
    percentile = percentile.floor(2)
    self.percentile = percentile.to_f.round(2)
    self.save
  end

  private

  def add_percentage
    percentage = (100 * correct) / questions
    percentage = percentage.to_f.round(2)
    self.percentage = percentage
  end
end
