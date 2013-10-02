require 'spec_helper'

describe Slideshowpro do
  context "#setup" do
    it "should setup a new Configuration instance" do
      Slideshowpro.setup {}
      Slideshowpro.configuration.should be_a_kind_of(Slideshowpro::Configuration)
    end
  end

  context "#example" do
    Slideshowpro.setup do |config|
      config.api_key = 'local-0ff623a8a48c9ecc6b095def793c0c70'
      config.api_uri = 'director.summit.com'

      config.preview do |f|
        f.crop        = Slideshowpro::Format.crop_to_fit
        f.height      = 50
        f.quality     = 85
        f.sharpening  = true
        f.width       = 100
      end

      config.size 'thumb',
        crop: Slideshowpro::Format.crop_to_fit,
        height: 75,
        quality: 95,
        sharpening: true,
        width: 75

      config.size 'small',
        crop: Slideshowpro::Format.crop_to_fit,
        height: 167,
        quality: 95,
        sharpening: true,
        width: 250

      config.size 'smallPortrait',
        crop: Slideshowpro::Format.crop_to_fit,
        height: 300,
        quality: 95,
        sharpening: true,
        width: 200

      config.size 'medium',
        crop: Slideshowpro::Format.crop_to_fit,
        height: 200,
        quality: 95,
        sharpening: true,
        width: 300

      config.size 'mediumPortrait',
        crop: Slideshowpro::Format.crop_to_fit,
        height: 750,
        quality: 95,
        sharpening: true,
        width: 500

      config.size 'large',
        crop: Slideshowpro::Format.crop_to_fit,
        height: 400,
        quality: 95,
        sharpening: true,
        width: 600

      config.size 'xlarge',
        crop: Slideshowpro::Format.crop_to_fit,
        height: 600,
        quality: 95,
        sharpening: true,
        width: 900
    end

    Slideshowpro::Album.find 1
    Slideshowpro::Album.all
    Slideshowpro::Content.find 819
  end
end
