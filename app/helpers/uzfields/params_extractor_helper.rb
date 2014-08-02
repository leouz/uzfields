module Uzfields::ParamsExtractorHelper
  def self.extract_model params
    params.split(' ').first   
  end
end