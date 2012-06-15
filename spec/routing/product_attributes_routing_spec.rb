require "spec_helper"

describe ProductAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_attributes").should route_to("product_attributes#index")
    end

    it "routes to #new" do
      get("/product_attributes/new").should route_to("product_attributes#new")
    end

    it "routes to #show" do
      get("/product_attributes/1").should route_to("product_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_attributes/1/edit").should route_to("product_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_attributes").should route_to("product_attributes#create")
    end

    it "routes to #update" do
      put("/product_attributes/1").should route_to("product_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_attributes/1").should route_to("product_attributes#destroy", :id => "1")
    end

  end
end
