require File.dirname(__FILE__) + '/../spec_helper'
require "matrix"

describe MatrixHelper do
  describe '#with_sign' do
    it "adds a plus sign when zero" do
      with_sign(0).should == '+0'
    end

    it "adds a plus sign with a positive number" do
      with_sign(98).should == '+98'
    end

    it "adds a plus sign with a positive float" do
      with_sign(0.1).should == '+0.1'
    end

    it "adds a minus sign with a negative number" do
      with_sign(-10).should == '-10'
    end

    it "adds a minus sign with a negative float" do
      with_sign(-0.1).should == '-0.1'
    end
  end

  describe '#eigen_values' do
    it "calculates eigen values for empty matrix" do
      eigen_values(Matrix[[0,0],[0,0]]).should == [0.0, 0.0]
    end

    it "calculates eign values for integer matrix" do
      eigen_values(Matrix[[-1,-2],[4,5]]).should == [3.0,1.0]
    end
  end
end
