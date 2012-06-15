class HomeController < ApplicationController
  def index
    @user = User.new
    @categories = Category.all
  end
  
  def survey
    @user = User.find_or_create_by_name(params[:user])
    session[:user_id] = @user.id
    if @user.save
      @category = Category.find(params[:category_id])
      session[:category_id] = @category.id
    else
      render action: "home"
    end
  end
  
  def survey_results
    @category = Category.find(session[:category_id])
    @user = User.find(session[:user_id])
    @category.update_attributes(params[:category])
    questions = Question.positive_by_user(@user.id)
    @matching_products = Product.match_by_attributes(questions.map(&:item_attribute))
  end
end
