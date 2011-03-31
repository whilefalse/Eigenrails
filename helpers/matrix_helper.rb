describe MatrixHelper do
  describe 'Fixnum#with_sign' do
    it "adds a plus sign when zero" do
      0.with_sign.should == '+0'
    end
  end
end
