class ParamsParser < GeneratorDefinition
  RELATIONSHIP_TYPES = %w(has_many has_one belongs_to)  
  
  def initialize(params)
    @relationships = []
    @fields = []

    @params = params.split(" ").map{ |i| i.downcase }
    
    @model_param = @params.first
    @params.delete_at(0)

    @controller_param = nil    
    if @params.first and @params.first.starts_with?('/')
      @controller_param = @params.first
      @params.delete_at(0)
    end

    parse_model
    parse_model_path
    parse_controller
    parse_controller_path
    parse_relationships
    parse_fields    
  end
  
  private

  def parse_model
    @model = @model_param.split("::").map{ |i| i.camelize }.join("::")
  end
  
  def parse_model_path
    @model_path = @model_param.split("::").join("/")
  end
  
  def parse_controller    
    @controller = @model_param.split("::").last + "_controller"
  end
  
  def parse_controller_path    
    @controller_path = "/"
    if @controller_param
      @controller_path = @controller_param.split('/').reject!{ |i| i.empty? }.join('/')
    end    
  end
  
  def parse_relationships
    to_exclude, i = [], 0
    @params.each do |p|
      split = p.split(':')
      if RELATIONSHIP_TYPES.include?(split[0]) and split[1]
        r = Relationship.new(type: split[0], entity: split[1].capitalize.singularize)
        r.thru = split[3] if split[2] and split[3] and split[2] == "thru"
        @relationships << r
        to_exclude << i
      end
      i += 1
    end
    to_exclude.reverse.each{ |j| @params.delete_at(j) }
  end

  def parse_fields
    to_exclude, i = [], 0
    @params.each do |p|
      split = p.split(':')            
      
      r = Field.new
      r.name = split[0]
      split.delete_at(0)
      
      if split[0]
        r.type = self.class.parse_field_name split[0] 
        r.type_options = self.class.parse_options split[0]
        split.delete_at(0)
      end

      r.is_index = false
      r.validations = []
      split.each do |s|
        field_name = self.class.parse_field_name s
        r.is_index = true if field_name == "index"
        r.validations = self.class.parse_options(s) if field_name == "validations"
      end      
      
      @fields << r      
      to_exclude << i
      i += 1
    end
    to_exclude.reverse.each{ |j| @params.delete_at(j) }
  end

  def self.parse_options input
    if input.include?("[") and  input.include?("]") 
      input.split("[")[1].split("]").first.split(",") 
    else 
      []
    end
  end

  def self.parse_field_name input
    if input.include?("[") and  input.include?("]")
      input.split("[").first.split(":").first
    else
      input
    end
  end
end 