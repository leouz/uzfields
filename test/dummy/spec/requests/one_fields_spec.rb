require 'rails_helper'

RSpec.describe "OneFields", :type => :request do
  describe "GET /one_fields" do
    it "works! (now write some real specs)" do
      get one_fields_path
      expect(response.status).to be(200)
    end
  end
end
