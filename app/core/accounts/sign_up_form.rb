module Accounts
  class SignUpForm < Rectify::Form
    mimic :account

    attribute :first_name,   String
    attribute :last_name,    String
    attribute :email,        String
    attribute :password,     String
    attribute :password_confirmation, String

    validates :first_name, :last_name, :presence => true
    validates :email, :presence => true, :email => true
    validates :password,
      :length => { :in => 8..72 },
      :confirmation => true,
      :presence => true
    validate :validate_email_uniqueness

    private

    def validate_email_uniqueness
      return if Security::CredentialByUsername.new(email).none?

      errors.add(:email, I18n.t(:already_in_use))
    end
  end
end
