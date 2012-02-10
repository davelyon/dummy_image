require 'spec_helper'

describe DummyImage::Image do
  let(:arguments) { stub( height: "200",
                           width: "200",
                         fgcolor: "333333",
                         bgcolor: "CCCCCC",
                          format: "png"
                        ) }
  describe "#image_name" do
    subject { described_class.new(arguments) }
    it { subject.image_name.should == "200_200_333333_CCCCCC.png" }
  end

  describe ".find" do
    let(:file_name) { "200_200_333333_CCCCCC.png" }
    subject { described_class.find(arguments) }
    context "when file exists" do
      before do
        File.stub(:exists?, "tmp/200_200_333333_CCCCCC.png").and_return(true)
      end
      it { subject.should == file_name }
    end

    context "when file does not exist" do
      before do
        File.stub(:exists?, "tmp/200_200_333333_CCCCCC.png").and_return(false)
        DummyImage::Image::ImageBuilder.stub(:build, ["200", "200", "333333", "CCCCCC", "200 x 200", "tmp/200_200_333333_CCCCCC.png"]).and_return(true)
      end
      it { subject.should == file_name }
    end
  end
end
