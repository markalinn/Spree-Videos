require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::Video do
  before { @video = FactoryGirl.create(:video) }
  let(:video) { @video }

  it "should handle different youtube strings" do
    video.youtube_ref = "http://www.youtube.com/watch?v=9t0n5MD9SBU"
    video.save
    video.reload.youtube_ref.should == "9t0n5MD9SBU"

    video.update_attributes :youtube_ref => 'iJ4T9CQA0UM'
    video.reload.youtube_ref.should == 'iJ4T9CQA0UM'

    video.update_attributes :youtube_ref =>  'http://youtu.be/9xtn36e2shw'
    video.reload.youtube_ref.should == '9xtn36e2shw'
  end

  it "should not allow two of same videos attached to a product" do
    expect{ FactoryGirl.create :video, :product => video.product }.to raise_error(ActiveRecord::RecordInvalid)
  end
end