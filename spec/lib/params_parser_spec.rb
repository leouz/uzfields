require 'rails_helper'

describe ParamsParser do
  describe "static methods" do
    it "parse_field_name" do        
      ParamsParser.send(:parse_field_name, "field_name").should == "field_name"
    end
  
    it "parse_field_name with type and options" do        
      ParamsParser.send(:parse_field_name, "field_name[option1,option2,option3]").should == "field_name"
    end

    it "parse_options" do        
      r = ParamsParser.send(:parse_options, "field_name").should == []
    end
    
    it "parse_options with type and options" do        
      r = ParamsParser.send(:parse_options, "field_name[option1,option2,option3]")
      r.to_set.should == %w(option1 option2 option3).to_set
    end    
  end 

  data = [    
    # validations: [ "required", "email", "unique", "no_spaces" ], 
    GeneratorDefinition.new({
      command: "admin::person /logged 
        has_many:fingers:thru:person_fingers 
        has_many:properties
        has_one:head
        eye_color:radio[blue,green,brown,honey]:validations[no_spaces]
        height:decimal:validations[required]
        email:email:index:validations[email,unique,no_spaces,required]",
      model: "Admin::Person",
      model_path: "admin/person",
      controller: "person_controller",
      controller_path: "logged",
      relationships: [
        GeneratorDefinition::Relationship.new({type: "has_many", entity: "Finger", thru: "person_fingers"}),
        GeneratorDefinition::Relationship.new({type: "has_many", entity: "Property", thru: nil}),
        GeneratorDefinition::Relationship.new({type: "has_one", entity: "Head", thru: nil})
      ],
      fields: [
        GeneratorDefinition::Field.new({name: "eye_color", type: "radio", is_index: false,
          type_options: %w(blue green brown honey), validations: %w(no_spaces)}),
        GeneratorDefinition::Field.new({name: "height", type: "decimal", is_index: false,
          type_options: [], validations: %w(required)}),
        GeneratorDefinition::Field.new({name: "email", type: "email", is_index: true,
          type_options: [], validations: %w(email unique no_spaces required)})
      ]
    })
  ]
  data.each do |d| 
    describe "#{d.command}\n" do
      parser = ParamsParser.new(d.command)

      it "model #{d.model}" do 
        parser.model.should == d.model 
      end
      it "model_path #{d.model_path}" do 
        parser.model_path.should == d.model_path 
      end
      it "controller #{d.controller}" do 
        parser.controller.should == d.controller 
      end
      it "controller_path #{d.controller_path}" do
        parser.controller_path.should == d.controller_path 
      end
        
      i = 0    
      d.relationships.each do |r|
        it "#{i}) relationship #{r.type}:#{r.entity}" do
          parser.relationships[i].type.should == r.type 
          parser.relationships[i].entity.should == r.entity 
          parser.relationships[i].thru.should == r.thru
          i += 1
        end        
      end

      j = 0      
      d.fields.each do |f|
        it "#{j}) fields #{f.name}:#{f.type}" do                          
          parser.fields[j].name.should == f.name 
          parser.fields[j].type.should == f.type 
          parser.fields[j].is_index.should == f.is_index
          parser.fields[j].type_options.to_set.should == f.type_options.to_set
          parser.fields[j].validations.to_set.should == f.validations.to_set                    
          j += 1
        end        
      end
    end
  end 
end
