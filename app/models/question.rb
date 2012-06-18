class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => false
  
  class << self
    def positive_by_user( user_id, category )
      answers = Answer.joins(:question).where("questions.category_id = ? AND answers.user_id = ?", category.id, user_id).order('answers.id DESC').limit(category.questions.count)
      Question.where('questions.id in (?)', answers.reject{ |x| x.response == "0" }.map(&:question_id))
    end
  end
end
