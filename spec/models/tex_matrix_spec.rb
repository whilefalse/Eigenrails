require File.dirname(__FILE__) + '/../spec_helper'

describe 'TexMatrix' do
  describe '#eigen_values' do
    it "calculates eigen values for empty matrix" do
      TexMatrix[[0,0],[0,0]].eigen_values.should == [0.0, 0.0]
    end

    it "calculates eign values for integer matrix" do
      TexMatrix[[-1,-2],[4,5]].eigen_values.should == [3.0,1.0]
    end

    it "calculates complex eigen values" do
      evs = TexMatrix[[3,-2],[4,1]].eigen_values
      evs[0].should be_within(0.1).of(Complex(2.0, 2.646))
      evs[1].should be_within(0.1).of(Complex(2.0, -2.646))
    end
  end
end
