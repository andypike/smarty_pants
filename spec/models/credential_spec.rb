RSpec.describe Credential do
  describe ".find_by_username" do
    let!(:me)    { create(:adult, :email => "me@here.com") }
    let!(:other) { create(:adult, :email => "other@here.com") }

    it "returns credentials with case matching usernames" do
      expect(
        described_class.find_by_username("me@here.com")
      ).to eq(me.credential)
    end

    it "returns credentials with case mismatching usernames" do
      expect(
        described_class.find_by_username("Me@hEre.Com")
      ).to eq(me.credential)
    end

    it "returns nil for not match" do
      expect(described_class.find_by_username("nope@here.com")).to be_nil
    end
  end
end
