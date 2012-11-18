class Web::ApplicationController < ApplicationController

  layout 'web/application'

  include BreadcrumbsHelper

  before_filter :base_title
  respond_to :html
  helper_method :title

  private

  def base_title
    title t("title.base")
  end

  def title(part = nil)
    @parts ||= []
    unless part
      return nil if @parts.blank?
      return @parts.reverse.join(' - ')
    end
    @parts << part
  end
end
