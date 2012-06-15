class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => false
  
  class << self
    def positive_by_user( user_id, category )
      answers = Answer.joins(:question).where("questions.category_id = ? AND answers.user_id = ?", category.id, user_id).order('answers.id DESC').limit(category.questions.count)
      question_ids = []
      answers.each do |answer|
        question_ids.push(answer.question.id) if answer.response == "1"
      end
      Question.where('questions.id in (?)', question_ids)
    end
  end
end
