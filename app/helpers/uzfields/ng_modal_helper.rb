module Uzfields::NgModalHelper
  include Uzfields::NgCommon

  class NgModal
    def initialize(context, options={})
      @context, @options = context, options      
    end

    def options
      @options      
    end

    def title &block
      @context.render partial: "#{Uzfields::NgCommon::PATH}/modal/title", locals: { options: @options, block: block }
    end

    def body &block
      @context.render partial: "#{Uzfields::NgCommon::PATH}/modal/body", locals: { options: @options, block: block }
    end

    def footer &block
      @context.render partial: "#{Uzfields::NgCommon::PATH}/modal/footer", locals: { options: @options, block: block }
    end
  end

  def ng_large_modal_for(id, &block)    
    options = { tag_id: id }
    i = NgModal.new(self, options)    
    render partial: "#{PATH}/modal/modal", locals: { options: options, block: block, instance: i }
  end
end