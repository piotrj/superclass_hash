require "spec_helper"

describe SuperclassHash do
  before(:each) do
    @superhash = SuperclassHash.new
  end

  context "for non-class keys" do
    it "should return value if assigned for given key" do
      @superhash[:key] = "a"
      @superhash[:key].should == "a"
    end

    it "should return nil if no value has been assigned for given key" do
      @superhash[:other_key].should == nil
    end
  end

  context "for class keys" do
    before(:all) do
      class A
      end

      class B < A
      end

      class C < B
      end
    end

    it "should return value if assigned for given key" do
      @superhash[A] = "a"
      @superhash[A].should == "a"
    end

    it "should return value if assigned for a superclass of key" do
      @superhash[A] = "a"
      @superhash[B].should == "a"
      @superhash[C].should == "a"
    end

    it "should return nil if no value assigned for any of ancestors" do
      @superhash[C].should == nil
    end

    it "if values has been assigned for few ancestors it should return the value of the nearest ancestor" do
      @superhash[A] = "a"
      @superhash[B] = "b"
      @superhash[C].should == "b"
    end
  end
end
