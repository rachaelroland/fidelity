require 'spec_helper'

describe "product_attributes/edit" do
  before(:each) do
    @product_attribute = assign(:product_attribute, stub_model(ProductAttribute,
      :attribute => "MyString",
      :product_id => 1
    ))
  end

  it "renders the edit product_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_attributes_path(@product_attribute), :method => "post" do
      assert_select "input#product_attribute_attribute", :name => "product_attribute[attribute]"
      assert_select "input#product_attribute_product_id", :name => "product_attribute[product_id]"
    end
  end
end
