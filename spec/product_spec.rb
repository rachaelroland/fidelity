require 'spec_helper'

describe Product do 
  
  before(:each) do
    @product = Product.new
  end
  
  it "should respond to get and set name" do
    @product.name = "hammer"
    @product.name.should == "hammer"
  end
  
  it "should respond to get and set price" do
    @product.price = 1.01
    @product.price.should == 1.01
  end
end