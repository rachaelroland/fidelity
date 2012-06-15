require 'spec_helper'

describe HomeController do

  describe "GET 'survey_results'" do
    it "returns http success" do
      get 'survey_results'
      response.should be_success
    end
  end

end
