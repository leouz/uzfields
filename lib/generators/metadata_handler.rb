  def initialize_columns_from_meta
    def excluded?(name)
      %w[_id _type id created_at updated_at].include?(name) ||
      [ /.*_checksum/, /.*_count/ ].any? {|p| name =~ p } ||
      options['excluded_columns']||[].include?(name)
    end

    @instance = @model.new
    
    @meta_columns = @model.columns.reject{|c| excluded?(c.name) }.map{|c| map_form_type(c)}          
  end