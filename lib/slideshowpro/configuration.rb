module Slideshowpro
  class Configuration
    attr_accessor :album
    attr_accessor :api_key
    attr_accessor :cache
    attr_accessor :cache_invalidator
    attr_accessor :cache_key
    attr_accessor :cache_path
    attr_accessor :dead
    attr_accessor :debug
    attr_accessor :endpoint
    attr_accessor :expires
    attr_accessor :is_local
    attr_accessor :preview
    attr_accessor :sizes
    attr_accessor :user_scope
    attr_accessor :user_sizes

    attr_writer :api_uri

    def initialize(options = {})
      options = {
        :api_key    => '',
        :api_uri    => URI.parse(''),
        :cache      => true,
        :cache_key  => '',
        :dead       => false,
        :debug      => true,
        :is_local   => false,
        :preview    => [],
        :sizes      => [],
        :user_scope => [],
        :user_sizes => []
      }.merge(options)

      @api_key    = options.delete :api_key
      @api_uri    = options.delete :api_uri
      @cache      = options.delete :cache
      @cache_key  = options.delete :cache_key
      @dead       = options.delete :dead
      @debug      = options.delete :debug
      @is_local   = options.delete :is_local
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

    def preview
      format = Format.new
      yield(format) if block_given?
      @preview = format
    end

    def api_uri
      uri = URI.parse @api_uri.to_s
      if uri.scheme.nil?
        uri.scheme = 'http'
        uri = URI.parse uri.to_s
      end

      if uri.path.nil?
        key = @api_key.split /^(.+)-(.+)$/

        path = []
        path.push 'index.php?' if key[1] == 'local'
        path.push 'api'

        uri.path = "/#{path.join('/')}"
      end

      uri
    end
  end
end
