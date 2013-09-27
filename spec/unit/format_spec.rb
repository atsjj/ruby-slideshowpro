require 'spec_helper'

describe Slideshowpro::Format do
  context "#class_variables" do
    it "should have static variables" do
      Slideshowpro::Format.crop_proportionally.should be_kind_of(Fixnum)
      Slideshowpro::Format.crop_to_fit.should be_kind_of(Fixnum)
      Slideshowpro::Format.no_crop.should be_kind_of(Fixnum)
    end
  end
end
