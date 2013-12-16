require 'spec_helper'

describe UsersHelper do
  describe "gravatar_for" do
    let(:user) { FactoryGirl.create(:user) }

    it "should generate an image tag with the correct gravatar url as src" do
      email_hash  = Digest::MD5::hexdigest(user.email)
      image_tag = gravatar_for(user)
      expect(image_tag).to match /^<img /
      expect(image_tag).to match /src="https:\/\/secure.gravatar.com\/avatar\/#{email_hash}\?s=50"/
      expect(image_tag).to match /alt="#{user.name}"/
      expect(image_tag).to match /class="gravatar"/
      expect(image_tag).to match /\/>$/
    end

    it "should generate an image tag with a gravatar url that includes the given size" do
      email_hash  = Digest::MD5::hexdigest(user.email)
      image_tag = gravatar_for(user, size: 42)
      expect(image_tag).to match /src="https:\/\/secure.gravatar.com\/avatar\/#{email_hash}\?s=42"/
    end
  end
end
