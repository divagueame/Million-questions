class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  before_validation :add_user
  validates_uniqueness_of :user, :scope => :question
  # accepts_nested_attributes_for :question

  private
  def add_user
    p 'CALLBACK IN MODEL'
    self.user = current_user
  end
end
