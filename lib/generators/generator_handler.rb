class GeneratorHandler
  def initialize(params)
    @definition = ParamsParser.new(params)
    @definition.fields = @definition.fields.map{ |f| AssumptionsHandler.new(f).figure_out }
    @definition.fields = @definition.fields.map{ |f| MappingHandler.new(f).figure_out }
  end
end
