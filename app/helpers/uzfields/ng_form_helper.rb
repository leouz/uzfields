module Uzfields::NgFormHelper
  include Uzfields::NgCommon
  
  class NgForm    
    def initialize(context, model=:model, options={})
      @context, @options = context, options
      @options[:model] = model      
    end

    def options
      @options      
    end

    def input field, type=:string, options={}  
      @context.ng_input options[:model], field, type, options
    end
  end

  def ng_form_for model=:model, options={}, &block
    f = NgForm.new(self, model, options)
    render partial: "#{PATH}/form/main/form", locals: { option: f.options, block: block, instance: f }
  end

  def ng_input model, field, type=:string, options={} 
    options[:model] = options[:model] ||= "model"         
    render partial: "#{PATH}/form/#{type}", locals: get_options(field, type, options)
  end
end