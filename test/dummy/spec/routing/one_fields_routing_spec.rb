require "rails_helper"

RSpec.describe OneFieldsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/one_fields").to route_to("one_fields#index")
    end

    it "routes to #new" do
      expect(:get => "/one_fields/new").to route_to("one_fields#new")
    end

    it "routes to #show" do
      expect(:get => "/one_fields/1").to route_to("one_fields#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/one_fields/1/edit").to route_to("one_fields#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/one_fields").to route_to("one_fields#create")
    end

    it "routes to #update" do
      expect(:put => "/one_fields/1").to route_to("one_fields#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/one_fields/1").to route_to("one_fields#destroy", :id => "1")
    end

  end
end
