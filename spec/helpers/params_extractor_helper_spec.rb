require 'rails_helper'

describe Uzfields::ParamsExtractorHelper do
  it "get primes until 10" do
    Uzfields::ParamsExtractorHelper.extract_model("admin lala") == "admin"
  end 
end