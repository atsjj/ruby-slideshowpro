require 'spec_helper'

describe Slideshowpro::Configuration do
  context "#initialize" do
    it "should configure a new Configuration instance" do
      config = Slideshowpro::Configuration.new
      config.should be_a_kind_of(Slideshowpro::Configuration)
    end
  end
end
