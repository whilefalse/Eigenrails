require File.dirname(__FILE__) + '/../spec_helper'
require "matrix"

describe MatrixHelper do
  describe 'Fixnum#with_sign' do
    it "adds a plus sign when zero" do
      0.with_sign.should == '+0'
    end

    it "adds a plus sign with a positive number" do
      98.with_sign.should == '+98'
    end

    it "adds a plus sign with a positive float" do
      0.1.with_sign.should == '+0.1'
    end

    it "adds a minus sign with a negative number" do
      (-10).with_sign.should == '-10'
    end

    it "adds a minus sign with a negative float" do
      (-0.1).with_sign.should == '-0.1'
    end
  end

  describe 'Matrix#eigen_values' do
    it "calculates eigen values for empty matrix" do
      Matrix[[0,0],[0,0]].eigen_values.should == [0.0, 0.0]
    end

    it "calculates eign values for integer matrix" do
      Matrix[[-1,-2],[4,5]].eigen_values.should == [3.0,1.0]
    end
  end
end
