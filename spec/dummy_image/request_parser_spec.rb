require 'spec_helper'

describe DummyImage::RequestParser do
  subject { described_class.new(path) }

  context "with nothing specified" do
    let(:path) { "/" }
    its(:height) { should == "300" }
    its(:width) { should == "300" }
    its(:fgcolor) { should == "333333" }
    its(:bgcolor) { should == "CCCCCC" }
  end

  context "with only height specified" do
    let(:path) { "/200" }
    its(:height) { should == "200" }
    its(:width) { should == "200" }
    its(:fgcolor) { should == "333333" }
    its(:bgcolor) { should == "CCCCCC" }
  end

  context "with height, width specified" do
    let(:path) { "/200/400" }
    its(:height) { should == "200" }
    its(:width) { should == "400" }
    its(:fgcolor) { should == "333333" }
    its(:bgcolor) { should == "CCCCCC" }
  end

  context "with height, width, foreground color specified" do
    let(:path) { "/200/400/434343" }
    its(:height) { should == "200" }
    its(:width) { should == "400" }
    its(:fgcolor) { should == "434343" }
    its(:bgcolor) { should == "CCCCCC" }
  end

  context "with height, width, foreground color, background color specified" do
    let(:path) { "/200/400/434343/505050" }
    its(:height) { should == "200" }
    its(:width) { should == "400" }
    its(:fgcolor) { should == "434343" }
    its(:bgcolor) { should == "505050" }
  end

  context "with image format specified" do
    let(:path) { "/200/400/434343/505050.png" }
    its(:height) { should == "200" }
    its(:width) { should == "400" }
    its(:fgcolor) { should == "434343" }
    its(:bgcolor) { should == "505050" }
    its(:format) { should == "png" }
  end

  context "with invalid image format specified" do
    let(:path) { "/200/400/434343/505050.swf" }
    its(:height) { should == "200" }
    its(:width) { should == "400" }
    its(:fgcolor) { should == "434343" }
    its(:bgcolor) { should == "505050" }
    its(:format) { should == "png" }
  end
end
