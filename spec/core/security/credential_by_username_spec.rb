RSpec.describe Security::CredentialByUsername do
  let!(:me)    { create(:credential, :username => "me@here.com") }
  let!(:other) { create(:credential, :username => "other@here.com") }

  context "with case matching username" do
    it "returns credentials" do
      expect(described_class.new("me@here.com").first).to eq(me)
    end
  end

  context "with case mismatching username" do
    it "returns credentials" do
      expect(described_class.new("Me@hEre.Com").first).to eq(me)
    end
  end

  context "with mismatching username" do
    it "returns no matches" do
      expect(described_class.new("nope@here.com")).to be_none
    end
  end
end
