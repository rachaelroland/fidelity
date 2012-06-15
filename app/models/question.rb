class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => false
  
  class << self
    def positive_by_user( user_id )
      Question.joins(:answers).where("answers.user_id = ? AND answers.response = '1'", user_id)
    end
  end
end
