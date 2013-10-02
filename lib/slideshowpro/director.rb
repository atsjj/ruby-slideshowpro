module Slideshowpro
  class Director
    class << self
      def find
        {}
      end

      def all
        []
      end

      protected

      def get(options = {})
        method = options.delete(:method) || ''

        sizes = {}
        Slideshowpro.configuration.sizes.each do |size|
          sizes["size[#{size.name}]"] = size.to_array.join(',')
        end

        preview = Slideshowpro.configuration.preview.to_array

        user_sizes = {}
        Slideshowpro.configuration.user_sizes.each do |size|
          sizes["user_size[#{size.name}]"] = size.to_array.join(',')
        end

        options = {
          api_key: Slideshowpro.configuration.api_key,
          breaker: true,
          format: 'json',
          preview: preview,
          url: ['api', method].join('/')
        }.merge(options).merge(sizes).merge(user_sizes)

        json = rest_get Slideshowpro.configuration.api_uri, options
        json['data']
      end

      private

      def rest_get(uri, options = {})
        data = RestClient.get uri.to_s, params: options
        JSON.parse(data)
      end
    end
  end
end

%w(album gallery content).each do |file|
  require File.join(File.dirname(__FILE__), "director", file)
end
