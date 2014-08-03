class GeneratorDefinition
  attr_accessor :model, :model_path, :controller, :controller_path, :relationships, :fields

  def initialize(params = nil)
    @relationships = []
    @fields = []
    if params
      @model = params[:model] if params[:model]
      @model_path = params[:model_path] if params[:model_path]
      @controller = params[:controller] if params[:controller]
      @controller_path = params[:controller_path] if params[:controller_path]
      @relationships = params[:relationships] if params[:relationships]
      @fields = params[:fields] if params[:fields]
    end
  end

  class Relationship
    attr_accessor :type, :entity, :thru

    def initialize(params = nil)
      debugger
      if params
        @type = params[:type] if params[:type]
        @entity  = params[:entity] if params[:entity]
        @thru = params[:thru] if params[:thru]
      end
    end
  end

  class Field
    attr_accessor :name, :type, :is_index, :type_options, :validations

    def initialize(params = nil)
      if params
        @name = params[:name] if params[:name]
        @type = params[:type] if params[:type]
        @is_index  = params[:is_index] if params[:is_index]
        @type_options = params[:type_options] if params[:type_options]
        @validations = params[:validations] if params[:validations]
      end
    end
  end
end

