class GeneratorDefinition
  attr_accessor :command, :model, :model_path, :controller, :controller_path, :relationships, :fields

  def initialize(params = nil)
    @relationships = []
    @fields = []
    if params
      @command = params[:command] if params[:command] != nil
      @model = params[:model] if params[:model] != nil
      @model_path = params[:model_path] if params[:model_path] != nil
      @controller = params[:controller] if params[:controller] != nil
      @controller_path = params[:controller_path] if params[:controller_path] != nil
      @relationships = params[:relationships] if params[:relationships] != nil
      @fields = params[:fields] if params[:fields] != nil
    end
  end

  class Relationship
    attr_accessor :type, :entity, :thru

    def initialize(params = nil)      
      if params
        @type = params[:type] if params[:type] != nil
        @entity  = params[:entity] if params[:entity] != nil
        @thru = params[:thru] if params[:thru] != nil
      end
    end
  end

  class Field
    attr_accessor :name, :type, :is_index, :type_options, :validations, :mapping

    def initialize(params = nil)
      if params
        @name = params[:name] if params[:name] != nil
        @type = params[:type] if params[:type] != nil
        @is_index  = params[:is_index] if params[:is_index] != nil
        @type_options = params[:type_options] if params[:type_options] != nil
        @validations = params[:validations] if params[:validations] != nil
        @mapping = params[:mapping] if params[:mapping] != nil
      end

      def ==(other)
        @name == other.name and
        @type == other.type and
        @is_index  == other.is_index and
        @type_options == other.type_options and
        @validations == other.validations and
        @mapping == other.mapping
      end
    end
  end
end

