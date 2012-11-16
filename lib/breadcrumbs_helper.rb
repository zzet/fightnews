module BreadcrumbsHelper
  extend ActiveSupport::Concern

  included do
    class << self
      def add_breadcrumb_with_sym(name, link)
        add_breadcrumb_without_sym(name, link.to_s)
      end
      alias_method_chain :add_breadcrumb, :sym

      def add_i18n_breadcrumb(locale_path, link, options = {})
        scope = [:breadcrumbs]
        spaces = self.name.underscore.split('/')
        spaces.last.sub!('_controller', '')
        add_breadcrumb(I18n.t(locale_path, options.merge(:scope => scope + spaces)), link)
      end
    end

    def add_breadcrumb_with_sym(name, link)
      add_breadcrumb_without_sym(name, link.to_s)
    end
    alias_method_chain :add_breadcrumb, :sym
  end

  def add_i18n_breadcrumb(locale_path, link, options = {})
    scope = [:breadcrumbs]
    spaces = self.class.name.underscore.split('/')
    spaces.last.sub!('_controller', '')
    add_breadcrumb(I18n.t(locale_path, options.merge(:scope => scope + spaces)), link)
  end
end
