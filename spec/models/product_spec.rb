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
  
  it "should destroy products by name" do
    name = 'test delete'
    product = Product.create!(name: name)
    Product.destroy_by_name(name)
    Product.find_all_by_name(name).size.should eq(0)
  end
  
  it "should find Products with matching item attributes" do
    @product.name = 'test w/attributes'
    attribute_value = 'tests'
    @product.save!
    @product.product_attributes.create!(item_attribute: attribute_value, product_id: @product.id)
    @matching_products = Product.match_by_attributes(attribute_value)
    @matching_products.to_a.size.should eq(1)
  end

end
