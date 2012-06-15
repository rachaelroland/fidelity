require 'spec_helper'

describe "product_attributes/new" do
  before(:each) do
    assign(:product_attribute, stub_model(ProductAttribute,
      :attribute => "MyString",
      :product_id => 1
    ).as_new_record)
  end

  it "renders new product_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_attributes_path, :method => "post" do
      assert_select "input#product_attribute_attribute", :name => "product_attribute[attribute]"
      assert_select "input#product_attribute_product_id", :name => "product_attribute[product_id]"
    end
  end
end
