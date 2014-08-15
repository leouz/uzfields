require 'rails_helper'

RSpec.describe "AllFieldTypes", :type => :request do
  describe "GET /all_field_types" do
    it "works! (now write some real specs)" do
      get all_field_types_path
      expect(response.status).to be(200)
    end
  end
end
