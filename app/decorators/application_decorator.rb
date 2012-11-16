class ApplicationDecorator < Draper::Base
  class << self
    def helpers
      Draper::ViewContext.current || ApplicationController.new.view_context
    end
    alias :h :helpers
  end

  def to_s
    source.to_s
  end
end
