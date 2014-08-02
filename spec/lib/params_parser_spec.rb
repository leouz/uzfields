require 'rails_helper'

describe ParamsParser do
  data = [    
    # validations: [ "required", "email", "unique", "no_spaces" ], 
    {
      params: "admin::person /logged 
        has_many:fingers:thru:person_fingers 
        has_many:properties
        has_one:head
        eye_color:radio[blue,green,brown,honey]:validate[no_spaces]
        height:decimal:validate[required]
        email:email:index:validate[email,unique,no_spaces,required]",
      model: "Admin::Person",
      model_path: "admin/person",
      controller: "person_controller",
      controller_path: "logged",
      relationships: [
        { type: "has_many", entity: "Finger", thru: "person_fingers" },
        { type: "has_many", entity: "Properties", thru: nil },
        { type: "has_one", entity: "Head", thru: nil }
      ],
      fields: [
        { 
          name: "eye_color", type: "radio", is_index: false,
          type_options: %w(blue green brown honey),
          validations: %w(no_spaces) 
        }, { 
          name: "height", type: "decimal", is_index: false,
          type_options: [],
          validations: %w(required) 
        }, { 
          name: "height", type: "decimal", is_index: true,
          type_options: [],
          validations: %w(email unique no_spaces required) 
        }
      ]
    }
  ]
  data.each do |d| 
    describe "#{d[:params]}\n" do
      parser = ParamsParser.new(d[:params])

      it "model #{d[:model]}" do 
        parser.model.should == d[:model] 
      end
      it "model_path #{d[:model_path]}" do 
        parser.model_path.should == d[:model_path] 
      end
      it "controller #{d[:controller]}" do 
        parser.controller.should == d[:controller] 
      end
      it "controller_path #{d[:controller_path]}" do
        parser.controller_path.should == d[:controller_path] 
      end
        
      i = 0    
      d[:relationships].each do |r|
        it "relationship #{r[:type]}:#{r[:entity]}" do
          parser.relationships[i].type.should == r[:type] 
          parser.relationships[i].entity.should == r[:entity] 
          parser.relationships[i].thru.should == r[:thru] 
          i += 1
        end
      end

      i = 0
      d[:fields].each do |f|
        it "fields #{f[:name]}:#{f[:type]}" do          
          parser.fields[i].name.should == f[:name] 
          parser.fields[i].type.should == f[:type] 
          parser.fields[i].is_index.should == f[:is_index]
          parser.fields[i].type_options.to_set.should == f[:type_options].to_set
          parser.fields[i].validations.to_set.should == f[:validations].to_set          
          i += 1
        end
      end
    end
  end 
end
