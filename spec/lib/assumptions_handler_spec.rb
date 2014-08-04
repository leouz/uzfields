require 'rails_helper'

describe AssumptionsHandler do
  data = [    
    {
      it: "string assumption",
      input: GeneratorDefinition::Field.new({name: "any_name", type: nil, is_index: nil,
          type_options: %w(), validations: %w()}),
      expected: GeneratorDefinition::Field.new({name: "any_name", type: "string", is_index: nil,
          type_options: %w(), validations: %w()})
    },
    {
      it: "image assumption",
      input: GeneratorDefinition::Field.new({name: "image", type: nil, is_index: nil,
          type_options: %w(), validations: %w()}),
      expected: GeneratorDefinition::Field.new({name: "image", type: "image", is_index: nil,
          type_options: %w(), validations: %w()})
    },
    {
      it: "image assumption",
      input: GeneratorDefinition::Field.new({name: "photo", type: nil, is_index: nil,
          type_options: %w(), validations: %w()}),
      expected: GeneratorDefinition::Field.new({name: "photo", type: "image", is_index: nil,
          type_options: %w(), validations: %w()})
    },
    {
      it: "image assumption",
      input: GeneratorDefinition::Field.new({name: "picture", type: nil, is_index: nil,
          type_options: %w(), validations: %w()}),
      expected: GeneratorDefinition::Field.new({name: "picture", type: "image", is_index: nil,
          type_options: %w(), validations: %w()})
    },
    {
      it: "no assumption",
      input: GeneratorDefinition::Field.new({name: "picture", type: "string", is_index: nil,
          type_options: %w(), validations: %w()}),
      expected: GeneratorDefinition::Field.new({name: "picture", type: "string", is_index: nil,
          type_options: %w(), validations: %w()})
    }
  ]
  data.each do |d| 
    it "#{d[:it]} - #{d[:input].name}" do 
      result = AssumptionsHandler.new(d[:input]).figure_out
      result.should == d[:expected] 
    end      
  end 
end
