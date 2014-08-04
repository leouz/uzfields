class AssumptionsHandler
  # GeneratorDefinition::Field.new({name: "height", type: "decimal", is_index: false,
  #         type_options: [], validations: %w(required)}),
  def initialize(field)
    @field = field    
  end

  def figure_out(ignore_type = false)    
    type_set_by_handler = false

    MAPPINGS.each do |m|
      if !type_set_by_handler and (@field.type == nil or ignore_type) and @field.name.include?(m[:include])
        @type_set_by_handler = true
        @field.type = m[:type]
        @field.validations += m[:validations]
      end
    end
    @field.type = "string" if @field.type == nil

    @field
  end

  private

  MAPPINGS = [
    { include: "permalink", type: "permalink", validations: %w() },
    { include: "link", type: "link", validations: %w() },
    { include: "email", type: "email", validations: %w(email) },
    { include: "pdf", type: "pdf", validations: %w() },
    { include: "file", type: "file", validations: %w() },
    { include: "image", type: "image", validations: %w() },
    { include: "image", type: "picture", validations: %w() },
    { include: "image", type: "photo", validations: %w() }
  ]

end