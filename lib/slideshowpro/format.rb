module Slideshowpro
  class Format
    class << self
      def crop_proportionally; return 0; end;
      def crop_to_fit; return 1; end;
      def no_crop; return 2; end;
    end

    attr_accessor :crop
    attr_accessor :height
    attr_accessor :name
    attr_accessor :quality
    attr_accessor :sharpening
    attr_accessor :width

    def initialize(options = {})
      options = {
        :crop       => Slideshowpro::Format.crop_proportionally,
        :height     => 0,
        :name       => '',
        :quality    => 100,
        :sharpening => false,
        :width      => 0
      }.merge(options)

      @crop       = options.delete :crop
      @height     = options.delete :height
      @name       = options.delete :name
      @quality    = options.delete :quality
      @sharpening = options.delete :sharpening
      @width      = options.delete :width
    end
  end
end
