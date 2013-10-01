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

        options = {
          api_key: Slideshowpro.configuration.api_key,
          breaker: true
        }.merge(options)

        uri = Slideshowpro.configuration.api_uri
        uri.path = uri.path.split('/').push(method).join('/')

        json = rest_get uri, options
        return json['data']
      end

      private

      def rest_get(uri, options = {})
        puts "#{uri.to_s}, #{options}"
        data = RestClient.get uri.to_s, options
        puts data
        return JSON.parse(data)
      end
    end
  end
end

%w(album gallery).each do |file|
  require File.join(File.dirname(__FILE__), "director", file)
end
