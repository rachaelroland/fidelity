require 'spec_helper'

describe "product_attributes/show" do
  before(:each) do
    @product_attribute = assign(:product_attribute, stub_model(ProductAttribute,
      :attribute => "Attribute",
      :product_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Attribute/)
    rendered.should match(/1/)
  end
end
