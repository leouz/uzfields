class ParamsParser  
  RELATIONSHIP_TYPES = %w(has_many has_one belongs_to)
  attr_accessor :model, :model_path, :controller, :controller_path

  def initialize(params, )
    @params = params.split(" ")
    
    @model_param = @params.first
    @params -= [@params.first]

    @controller_param = nil
    if @params.first and @params.first.starts_with?('/')
      @controller_param = @params.first
      @params -= [@params.first]
    end

    parse_model
    parse_model_path
    parse_controller
    parse_controller_path
    parse_relationships
  end
  
  private

  def parse_model
    @model = @model_param.split("::").map{ |i| i.camelize }.join("::")
  end
  
  def parse_model_path
    @model_path = @model_param.split("::").join("/")
  end
  
  def parse_controller
    @controller = @model_param.split("::").last.underscore + "_controller"
  end
  
  def parse_controller_path    
    @controller_path = "/"
    if @controller_param
      @controller_path = @controller_param.underscore.split('/').reject!{ |i| i.empty? }.join('/')
    end    
  end
  
  def parse_relationships

  end

  public

  class Relationship
    attr_accessor :type, :entity, :thru
  end
end 