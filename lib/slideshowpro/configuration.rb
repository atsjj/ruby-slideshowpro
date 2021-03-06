module Slideshowpro
  class Configuration
    # attr_accessor :cache
    # attr_accessor :cache_invalidator
    # attr_accessor :cache_key
    # attr_accessor :cache_path
    # attr_accessor :expires
    attr_accessor :preview
    attr_accessor :sizes
    attr_accessor :user_scope
    attr_accessor :user_sizes

    attr_writer :api_key
    attr_writer :api_uri

    def initialize(options = {})
      options = {
        :api_key    => '',
        :api_uri    => URI.parse(''),
        # :cache      => true,
        # :cache_key  => '',
        :preview    => [],
        :sizes      => [],
        :user_scope => [],
        :user_sizes => []
      }.merge(options)

      @api_key    = options.delete :api_key
      @api_uri    = options.delete :api_uri
      # @cache      = options.delete :cache
      # @cache_key  = options.delete :cache_key
      @preview    = options.delete :preview
      @sizes      = options.delete :sizes
      @user_scope = options.delete :user_scope
      @user_sizes = options.delete :user_sizes
    end

    def size(name, options = {})
      options = {
        :name => name
      }.merge(options)

      format = Format.new options
      yield(format) if block_given?
      @sizes << format
    end

    def user_size(name, options = {})
      options = {
        :name => name
      }.merge(options)

      format = Format.new options
      yield(format) if block_given?
      @user_sizes << format
    end

    def preview
      format = Format.new
      yield(format) if block_given?
      @preview = format
    end

    def api_key
      key = @api_key.split /^(.+)-(.+)$/
      key.last.to_s
    end

    def api_uri
      uri = Addressable::URI.parse @api_uri.to_s

      if uri.scheme.nil?
        uri = Addressable::URI.parse "http://#{@api_uri.to_s}"
      end

      if uri.path.empty?
        uri.path = '/index.php'
      end

      uri
    end
  end
end
