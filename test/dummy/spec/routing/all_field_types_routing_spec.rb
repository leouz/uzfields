require "rails_helper"

RSpec.describe AllFieldTypesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/all_field_types").to route_to("all_field_types#index")
    end

    it "routes to #new" do
      expect(:get => "/all_field_types/new").to route_to("all_field_types#new")
    end

    it "routes to #show" do
      expect(:get => "/all_field_types/1").to route_to("all_field_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/all_field_types/1/edit").to route_to("all_field_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/all_field_types").to route_to("all_field_types#create")
    end

    it "routes to #update" do
      expect(:put => "/all_field_types/1").to route_to("all_field_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/all_field_types/1").to route_to("all_field_types#destroy", :id => "1")
    end

  end
end
