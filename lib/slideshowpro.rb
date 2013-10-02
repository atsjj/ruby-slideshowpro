require 'addressable/uri'
require 'json'
require 'rest_client'

%w(configuration director format version).each do |file|
  require File.join(File.dirname(__FILE__), "slideshowpro", file)
end

module Slideshowpro
  class << self
    attr_accessor :configuration

    def setup
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
