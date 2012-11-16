require 'addressable/uri'

module Filters
  def self.site(value)
    return nil unless value
    uri = Addressable::URI.parse(value)
    scheme = uri.scheme.blank? ? "http" : uri.scheme
    host = uri.host if uri.host.present?
    path = uri.path
    query = uri.query

    if host.present? || path.present?
      uri_array = [scheme, "://", host, path]
      uri_array << ["?", query] if query.present?
      uri_array.join
    else
      nil
    end
  rescue Addressable::URI::InvalidURIError, URI::Error
    nil
  end
end
