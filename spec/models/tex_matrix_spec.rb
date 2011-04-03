require File.dirname(__FILE__) + '/../spec_helper'

describe 'TexMatrix' do
  describe '#eigen_values' do
    it "calculates eigen values for empty matrix" do
      TexMatrix[[0,0],[0,0]].eigen_values.should == [0.0, 0.0]
    end

    it "calculates eign values for integer matrix" do
      TexMatrix[[-1,-2],[4,5]].eigen_values.should == [3.0,1.0]
    end
  end
end
