module Uzfields::NgHelper 
  PATH = "uzfields/angular"
  def get_locals field, type=:string, options={}
    options[:field] = field
    # options[:ng_model]
    # options[:model]v
    # options[:placeholder]
    # options[:hint]
    
    options[:tag_name] = "one_image_field[#{field}]"
    options[:tag_id] = "one_image_field_#{field}"
    { path: PATH, options: options }
  end

  def ng_input field, type=:string, options={}  
    options[:ng_model] = "modalForm.#{field}"   
    render partial: "#{PATH}/input/#{type}", locals: get_locals(field, type, options)
  end

  def ng_view field, type=:string, options={}
    options[:ng_model] = "modalView.#{field}"
    render partial: "#{PATH}/view/#{type}", locals: get_locals(field, type, options)
  end

  def ng_search field, type=:string, options={}
    options[:ng_model] = "search.#{field}" 
    render partial: "#{PATH}/input/#{type}", locals: get_locals(field, type, options)
  end

  def ng_th field    
    render partial: "#{PATH}/other/th", locals: { field: field }
  end

  def ng_pagination
    render partial: "#{PATH}/other/pagination"
  end

  def ng_form(url, &block)
    raise ArgumentError, "Missing block" unless block_given?    
    yield
  end
end

 # def form_for(record, options = {}, &block)
        # html_options = options[:html] ||= {}