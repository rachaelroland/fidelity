class Answer < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  
  belongs_to :question
  belongs_to :user
  
  class << self
    def summary_of_responses
      results = Answer.joins(:question).group(:query, :response).order(:query).count
      results.each do |result|
        user_response = (result[0][1] == "1") ? "Yes" : "No"
        puts "response to: #{result[0][0]} count: #{result[1]} said: #{user_response}"
      end
    end
  end
end
