require 'spec_helper'

describe ApplicationHelper do 

  describe "full_title" do
    it "should concatenate base title and page title" do
      expect(full_title("foo", "bar")).to eq("foo | bar")
    end

    it "should include only the base title if page title is nil" do
      expect(full_title("foo", nil)).to eq("foo")
    end

    it "should include only the base title if page title is an empty string" do
      expect(full_title("foo", "")).to eq("foo")
    end
  end

end
