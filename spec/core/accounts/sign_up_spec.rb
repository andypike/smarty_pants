RSpec.describe Accounts::SignUp do
  subject { described_class.new(form) }

  context "when the form is invalid" do
    let(:form) { double(:invalid? => true) }

    it "broadcasts :invalid" do
      expect { subject.call }.to broadcast(:invalid)
    end
  end

  context "when the form is valid" do
    let(:account) { Account.order(:created_at => :desc).first }
    let(:form) do
      Accounts::SignUpForm.new(
        :first_name => "Andy",
        :last_name  => "Pike",
        :email      => "me@here.com",
        :password   => "secret123",
        :password_confirmation => "secret123"
      )
    end

    it "creates a new account" do
      expect { subject.call }.to change(Account, :count).by(1)
    end

    it "adds the first adult to the account" do
      subject.call

      expect(account.adults.first).to have_attributes(
        :first_name => "Andy",
        :last_name  => "Pike",
        :email      => "me@here.com"
      )
    end

    it "adds an credentials for the adult" do
      subject.call

      credentials = account.adults.first.credential

      expect(credentials.username).to eq("me@here.com")
      expect(credentials.authenticate("secret123")).to be_truthy
    end

    it "send the adult a welcome email" do
      subject.call

      welcome_email = email_with_subject("Welcome to Smarty Pants")

      expect(welcome_email).to be_present
    end

    it "broadcasts :ok" do
      expect { subject.call }.to broadcast(:ok)
    end

    context "when saving fails due to race condition of unique username" do
      it "broadcasts :race_non_unique_email" do
        create(:adult, :email => "me@here.com")
        allow(form).to receive(:valid?).and_return(true)

        expect { subject.call }.to broadcast(:race_non_unique_email)
      end
    end
  end
end
