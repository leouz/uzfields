module Uzfields::NgHelper
  include Uzfields::NgFormHelper
  include Uzfields::NgModalHelper
  include Uzfields::NgCommon
  
  def ng_view field, type=:string, options={}    
    render partial: "#{PATH}/view/string", locals: get_options(field, type, options)
  end

  def ng_search field, type=:string, options={}
    options[:model] = options[:model] ||= "search" 
    render partial: "#{PATH}/form/#{type}", locals: get_options(field, type, options)
  end

  def ng_th field    
    render partial: "#{PATH}/other/th", locals: { field: field }
  end

  def ng_td field, type=:string
    render partial: "#{PATH}/td/#{type}", locals: { field: field }
  end

  def ng_pagination
    render partial: "#{PATH}/other/pagination"
  end
end
