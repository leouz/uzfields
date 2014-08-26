module Uzfields::NgCommon
  PATH = "uzfields/ng"
  
  def get_options field, type=:string, options={}
    options[:type] = type
    options[:field] = field
    options[:model] = options[:model] ||= "model"
    options[:ng_model] = options[:ng_model] ||= "#{options[:model]}.#{field}"
    # options[:placeholder]
    # options[:hint]    
    options[:tag_name] = field
    options[:tag_id] = "#{options[:model]}_#{field}"
    { path: PATH, options: options }
  end
end